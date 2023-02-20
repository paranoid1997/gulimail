<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
    <el-form-item label="?˿??Ķ???" prop="orderReturnId">
      <el-input v-model="dataForm.orderReturnId" placeholder="?˿??Ķ???"></el-input>
    </el-form-item>
    <el-form-item label="?˿??" prop="refund">
      <el-input v-model="dataForm.refund" placeholder="?˿??"></el-input>
    </el-form-item>
    <el-form-item label="?˿????ˮ?" prop="refundSn">
      <el-input v-model="dataForm.refundSn" placeholder="?˿????ˮ?"></el-input>
    </el-form-item>
    <el-form-item label="?˿?״̬" prop="refundStatus">
      <el-input v-model="dataForm.refundStatus" placeholder="?˿?״̬"></el-input>
    </el-form-item>
    <el-form-item label="?˿?????[1-֧??????2-΢?ţ?3-??????4-???" prop="refundChannel">
      <el-input v-model="dataForm.refundChannel" placeholder="?˿?????[1-֧??????2-΢?ţ?3-??????4-???"></el-input>
    </el-form-item>
    <el-form-item label="" prop="refundContent">
      <el-input v-model="dataForm.refundContent" placeholder=""></el-input>
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
          orderReturnId: '',
          refund: '',
          refundSn: '',
          refundStatus: '',
          refundChannel: '',
          refundContent: ''
        },
        dataRule: {
          orderReturnId: [
            { required: true, message: '?˿??Ķ???不能为空', trigger: 'blur' }
          ],
          refund: [
            { required: true, message: '?˿??不能为空', trigger: 'blur' }
          ],
          refundSn: [
            { required: true, message: '?˿????ˮ?不能为空', trigger: 'blur' }
          ],
          refundStatus: [
            { required: true, message: '?˿?״̬不能为空', trigger: 'blur' }
          ],
          refundChannel: [
            { required: true, message: '?˿?????[1-֧??????2-΢?ţ?3-??????4-???不能为空', trigger: 'blur' }
          ],
          refundContent: [
            { required: true, message: '不能为空', trigger: 'blur' }
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
              url: this.$http.adornUrl(`/order/omsrefundinfo/info/${this.dataForm.id}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.orderReturnId = data.omsRefundInfo.orderReturnId
                this.dataForm.refund = data.omsRefundInfo.refund
                this.dataForm.refundSn = data.omsRefundInfo.refundSn
                this.dataForm.refundStatus = data.omsRefundInfo.refundStatus
                this.dataForm.refundChannel = data.omsRefundInfo.refundChannel
                this.dataForm.refundContent = data.omsRefundInfo.refundContent
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
              url: this.$http.adornUrl(`/order/omsrefundinfo/${!this.dataForm.id ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'id': this.dataForm.id || undefined,
                'orderReturnId': this.dataForm.orderReturnId,
                'refund': this.dataForm.refund,
                'refundSn': this.dataForm.refundSn,
                'refundStatus': this.dataForm.refundStatus,
                'refundChannel': this.dataForm.refundChannel,
                'refundContent': this.dataForm.refundContent
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
