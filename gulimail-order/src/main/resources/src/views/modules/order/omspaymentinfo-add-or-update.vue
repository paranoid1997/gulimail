<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
    <el-form-item label="?????ţ?????ҵ???ţ?" prop="orderSn">
      <el-input v-model="dataForm.orderSn" placeholder="?????ţ?????ҵ???ţ?"></el-input>
    </el-form-item>
    <el-form-item label="????id" prop="orderId">
      <el-input v-model="dataForm.orderId" placeholder="????id"></el-input>
    </el-form-item>
    <el-form-item label="֧??????????ˮ?" prop="alipayTradeNo">
      <el-input v-model="dataForm.alipayTradeNo" placeholder="֧??????????ˮ?"></el-input>
    </el-form-item>
    <el-form-item label="֧???ܽ" prop="totalAmount">
      <el-input v-model="dataForm.totalAmount" placeholder="֧???ܽ"></el-input>
    </el-form-item>
    <el-form-item label="???????" prop="subject">
      <el-input v-model="dataForm.subject" placeholder="???????"></el-input>
    </el-form-item>
    <el-form-item label="֧??״̬" prop="paymentStatus">
      <el-input v-model="dataForm.paymentStatus" placeholder="֧??״̬"></el-input>
    </el-form-item>
    <el-form-item label="????ʱ?" prop="createTime">
      <el-input v-model="dataForm.createTime" placeholder="????ʱ?"></el-input>
    </el-form-item>
    <el-form-item label="ȷ??ʱ?" prop="confirmTime">
      <el-input v-model="dataForm.confirmTime" placeholder="ȷ??ʱ?"></el-input>
    </el-form-item>
    <el-form-item label="?ص????" prop="callbackContent">
      <el-input v-model="dataForm.callbackContent" placeholder="?ص????"></el-input>
    </el-form-item>
    <el-form-item label="?ص?ʱ?" prop="callbackTime">
      <el-input v-model="dataForm.callbackTime" placeholder="?ص?ʱ?"></el-input>
    </el-form-item>
    </el-form>
    <span slot="footer" class="dialog-footer">
      <el-button @click="visible = false">取消</el-button>
      <el-button type="primary" @click="dataFormSubmit()">确定</el-button>
    </span>
  </el-dialog>
</template>

<script>
  export default {
    data () {
      return {
        visible: false,
        dataForm: {
          id: 0,
          orderSn: '',
          orderId: '',
          alipayTradeNo: '',
          totalAmount: '',
          subject: '',
          paymentStatus: '',
          createTime: '',
          confirmTime: '',
          callbackContent: '',
          callbackTime: ''
        },
        dataRule: {
          orderSn: [
            { required: true, message: '?????ţ?????ҵ???ţ?不能为空', trigger: 'blur' }
          ],
          orderId: [
            { required: true, message: '????id不能为空', trigger: 'blur' }
          ],
          alipayTradeNo: [
            { required: true, message: '֧??????????ˮ?不能为空', trigger: 'blur' }
          ],
          totalAmount: [
            { required: true, message: '֧???ܽ不能为空', trigger: 'blur' }
          ],
          subject: [
            { required: true, message: '???????不能为空', trigger: 'blur' }
          ],
          paymentStatus: [
            { required: true, message: '֧??״̬不能为空', trigger: 'blur' }
          ],
          createTime: [
            { required: true, message: '????ʱ?不能为空', trigger: 'blur' }
          ],
          confirmTime: [
            { required: true, message: 'ȷ??ʱ?不能为空', trigger: 'blur' }
          ],
          callbackContent: [
            { required: true, message: '?ص????不能为空', trigger: 'blur' }
          ],
          callbackTime: [
            { required: true, message: '?ص?ʱ?不能为空', trigger: 'blur' }
          ]
        }
      }
    },
    methods: {
      init (id) {
        this.dataForm.id = id || 0
        this.visible = true
        this.$nextTick(() => {
          this.$refs['dataForm'].resetFields()
          if (this.dataForm.id) {
            this.$http({
              url: this.$http.adornUrl(`/order/omspaymentinfo/info/${this.dataForm.id}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.orderSn = data.omsPaymentInfo.orderSn
                this.dataForm.orderId = data.omsPaymentInfo.orderId
                this.dataForm.alipayTradeNo = data.omsPaymentInfo.alipayTradeNo
                this.dataForm.totalAmount = data.omsPaymentInfo.totalAmount
                this.dataForm.subject = data.omsPaymentInfo.subject
                this.dataForm.paymentStatus = data.omsPaymentInfo.paymentStatus
                this.dataForm.createTime = data.omsPaymentInfo.createTime
                this.dataForm.confirmTime = data.omsPaymentInfo.confirmTime
                this.dataForm.callbackContent = data.omsPaymentInfo.callbackContent
                this.dataForm.callbackTime = data.omsPaymentInfo.callbackTime
              }
            })
          }
        })
      },
      // 表单提交
      dataFormSubmit () {
        this.$refs['dataForm'].validate((valid) => {
          if (valid) {
            this.$http({
              url: this.$http.adornUrl(`/order/omspaymentinfo/${!this.dataForm.id ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'id': this.dataForm.id || undefined,
                'orderSn': this.dataForm.orderSn,
                'orderId': this.dataForm.orderId,
                'alipayTradeNo': this.dataForm.alipayTradeNo,
                'totalAmount': this.dataForm.totalAmount,
                'subject': this.dataForm.subject,
                'paymentStatus': this.dataForm.paymentStatus,
                'createTime': this.dataForm.createTime,
                'confirmTime': this.dataForm.confirmTime,
                'callbackContent': this.dataForm.callbackContent,
                'callbackTime': this.dataForm.callbackTime
              })
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.$message({
                  message: '操作成功',
                  type: 'success',
                  duration: 1500,
                  onClose: () => {
                    this.visible = false
                    this.$emit('refreshDataList')
                  }
                })
              } else {
                this.$message.error(data.msg)
              }
            })
          }
        })
      }
    }
  }
</script>
