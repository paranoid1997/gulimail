<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
    <el-form-item label="order_id" prop="orderId">
      <el-input v-model="dataForm.orderId" placeholder="order_id"></el-input>
    </el-form-item>
    <el-form-item label="?˻???Ʒid" prop="skuId">
      <el-input v-model="dataForm.skuId" placeholder="?˻???Ʒid"></el-input>
    </el-form-item>
    <el-form-item label="???????" prop="orderSn">
      <el-input v-model="dataForm.orderSn" placeholder="???????"></el-input>
    </el-form-item>
    <el-form-item label="????ʱ?" prop="createTime">
      <el-input v-model="dataForm.createTime" placeholder="????ʱ?"></el-input>
    </el-form-item>
    <el-form-item label="??Ա?û???" prop="memberUsername">
      <el-input v-model="dataForm.memberUsername" placeholder="??Ա?û???"></el-input>
    </el-form-item>
    <el-form-item label="?˿??" prop="returnAmount">
      <el-input v-model="dataForm.returnAmount" placeholder="?˿??"></el-input>
    </el-form-item>
    <el-form-item label="?˻???????" prop="returnName">
      <el-input v-model="dataForm.returnName" placeholder="?˻???????"></el-input>
    </el-form-item>
    <el-form-item label="?˻??˵绰" prop="returnPhone">
      <el-input v-model="dataForm.returnPhone" placeholder="?˻??˵绰"></el-input>
    </el-form-item>
    <el-form-item label="????״̬[0->?????�1->?˻??У?2->?????ɣ?3->?Ѿܾ?]" prop="status">
      <el-input v-model="dataForm.status" placeholder="????״̬[0->?????�1->?˻??У?2->?????ɣ?3->?Ѿܾ?]"></el-input>
    </el-form-item>
    <el-form-item label="????ʱ?" prop="handleTime">
      <el-input v-model="dataForm.handleTime" placeholder="????ʱ?"></el-input>
    </el-form-item>
    <el-form-item label="??ƷͼƬ" prop="skuImg">
      <el-input v-model="dataForm.skuImg" placeholder="??ƷͼƬ"></el-input>
    </el-form-item>
    <el-form-item label="??Ʒ???" prop="skuName">
      <el-input v-model="dataForm.skuName" placeholder="??Ʒ???"></el-input>
    </el-form-item>
    <el-form-item label="??ƷƷ?" prop="skuBrand">
      <el-input v-model="dataForm.skuBrand" placeholder="??ƷƷ?"></el-input>
    </el-form-item>
    <el-form-item label="??Ʒ????????(JSON)" prop="skuAttrsVals">
      <el-input v-model="dataForm.skuAttrsVals" placeholder="??Ʒ????????(JSON)"></el-input>
    </el-form-item>
    <el-form-item label="?˻?????" prop="skuCount">
      <el-input v-model="dataForm.skuCount" placeholder="?˻?????"></el-input>
    </el-form-item>
    <el-form-item label="??Ʒ???" prop="skuPrice">
      <el-input v-model="dataForm.skuPrice" placeholder="??Ʒ???"></el-input>
    </el-form-item>
    <el-form-item label="??Ʒʵ??֧?????" prop="skuRealPrice">
      <el-input v-model="dataForm.skuRealPrice" placeholder="??Ʒʵ??֧?????"></el-input>
    </el-form-item>
    <el-form-item label="ԭ?" prop="reason">
      <el-input v-model="dataForm.reason" placeholder="ԭ?"></el-input>
    </el-form-item>
    <el-form-item label="????" prop="description??">
      <el-input v-model="dataForm.description??" placeholder="????"></el-input>
    </el-form-item>
    <el-form-item label="ƾ֤ͼƬ???Զ??Ÿ" prop="descPics">
      <el-input v-model="dataForm.descPics" placeholder="ƾ֤ͼƬ???Զ??Ÿ"></el-input>
    </el-form-item>
    <el-form-item label="???�ע" prop="handleNote">
      <el-input v-model="dataForm.handleNote" placeholder="???�ע"></el-input>
    </el-form-item>
    <el-form-item label="??????Ա" prop="handleMan">
      <el-input v-model="dataForm.handleMan" placeholder="??????Ա"></el-input>
    </el-form-item>
    <el-form-item label="?ջ??" prop="receiveMan">
      <el-input v-model="dataForm.receiveMan" placeholder="?ջ??"></el-input>
    </el-form-item>
    <el-form-item label="?ջ?ʱ?" prop="receiveTime">
      <el-input v-model="dataForm.receiveTime" placeholder="?ջ?ʱ?"></el-input>
    </el-form-item>
    <el-form-item label="?ջ???ע" prop="receiveNote">
      <el-input v-model="dataForm.receiveNote" placeholder="?ջ???ע"></el-input>
    </el-form-item>
    <el-form-item label="?ջ??绰" prop="receivePhone">
      <el-input v-model="dataForm.receivePhone" placeholder="?ջ??绰"></el-input>
    </el-form-item>
    <el-form-item label="??˾?ջ???ַ" prop="companyAddress">
      <el-input v-model="dataForm.companyAddress" placeholder="??˾?ջ???ַ"></el-input>
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
          orderId: '',
          skuId: '',
          orderSn: '',
          createTime: '',
          memberUsername: '',
          returnAmount: '',
          returnName: '',
          returnPhone: '',
          status: '',
          handleTime: '',
          skuImg: '',
          skuName: '',
          skuBrand: '',
          skuAttrsVals: '',
          skuCount: '',
          skuPrice: '',
          skuRealPrice: '',
          reason: '',
          description??: '',
          descPics: '',
          handleNote: '',
          handleMan: '',
          receiveMan: '',
          receiveTime: '',
          receiveNote: '',
          receivePhone: '',
          companyAddress: ''
        },
        dataRule: {
          orderId: [
            { required: true, message: 'order_id不能为空', trigger: 'blur' }
          ],
          skuId: [
            { required: true, message: '?˻???Ʒid不能为空', trigger: 'blur' }
          ],
          orderSn: [
            { required: true, message: '???????不能为空', trigger: 'blur' }
          ],
          createTime: [
            { required: true, message: '????ʱ?不能为空', trigger: 'blur' }
          ],
          memberUsername: [
            { required: true, message: '??Ա?û???不能为空', trigger: 'blur' }
          ],
          returnAmount: [
            { required: true, message: '?˿??不能为空', trigger: 'blur' }
          ],
          returnName: [
            { required: true, message: '?˻???????不能为空', trigger: 'blur' }
          ],
          returnPhone: [
            { required: true, message: '?˻??˵绰不能为空', trigger: 'blur' }
          ],
          status: [
            { required: true, message: '????״̬[0->?????�1->?˻??У?2->?????ɣ?3->?Ѿܾ?]不能为空', trigger: 'blur' }
          ],
          handleTime: [
            { required: true, message: '????ʱ?不能为空', trigger: 'blur' }
          ],
          skuImg: [
            { required: true, message: '??ƷͼƬ不能为空', trigger: 'blur' }
          ],
          skuName: [
            { required: true, message: '??Ʒ???不能为空', trigger: 'blur' }
          ],
          skuBrand: [
            { required: true, message: '??ƷƷ?不能为空', trigger: 'blur' }
          ],
          skuAttrsVals: [
            { required: true, message: '??Ʒ????????(JSON)不能为空', trigger: 'blur' }
          ],
          skuCount: [
            { required: true, message: '?˻?????不能为空', trigger: 'blur' }
          ],
          skuPrice: [
            { required: true, message: '??Ʒ???不能为空', trigger: 'blur' }
          ],
          skuRealPrice: [
            { required: true, message: '??Ʒʵ??֧?????不能为空', trigger: 'blur' }
          ],
          reason: [
            { required: true, message: 'ԭ?不能为空', trigger: 'blur' }
          ],
          description??: [
            { required: true, message: '????不能为空', trigger: 'blur' }
          ],
          descPics: [
            { required: true, message: 'ƾ֤ͼƬ???Զ??Ÿ不能为空', trigger: 'blur' }
          ],
          handleNote: [
            { required: true, message: '???�ע不能为空', trigger: 'blur' }
          ],
          handleMan: [
            { required: true, message: '??????Ա不能为空', trigger: 'blur' }
          ],
          receiveMan: [
            { required: true, message: '?ջ??不能为空', trigger: 'blur' }
          ],
          receiveTime: [
            { required: true, message: '?ջ?ʱ?不能为空', trigger: 'blur' }
          ],
          receiveNote: [
            { required: true, message: '?ջ???ע不能为空', trigger: 'blur' }
          ],
          receivePhone: [
            { required: true, message: '?ջ??绰不能为空', trigger: 'blur' }
          ],
          companyAddress: [
            { required: true, message: '??˾?ջ???ַ不能为空', trigger: 'blur' }
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
              url: this.$http.adornUrl(`/order/omsorderreturnapply/info/${this.dataForm.id}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.orderId = data.omsOrderReturnApply.orderId
                this.dataForm.skuId = data.omsOrderReturnApply.skuId
                this.dataForm.orderSn = data.omsOrderReturnApply.orderSn
                this.dataForm.createTime = data.omsOrderReturnApply.createTime
                this.dataForm.memberUsername = data.omsOrderReturnApply.memberUsername
                this.dataForm.returnAmount = data.omsOrderReturnApply.returnAmount
                this.dataForm.returnName = data.omsOrderReturnApply.returnName
                this.dataForm.returnPhone = data.omsOrderReturnApply.returnPhone
                this.dataForm.status = data.omsOrderReturnApply.status
                this.dataForm.handleTime = data.omsOrderReturnApply.handleTime
                this.dataForm.skuImg = data.omsOrderReturnApply.skuImg
                this.dataForm.skuName = data.omsOrderReturnApply.skuName
                this.dataForm.skuBrand = data.omsOrderReturnApply.skuBrand
                this.dataForm.skuAttrsVals = data.omsOrderReturnApply.skuAttrsVals
                this.dataForm.skuCount = data.omsOrderReturnApply.skuCount
                this.dataForm.skuPrice = data.omsOrderReturnApply.skuPrice
                this.dataForm.skuRealPrice = data.omsOrderReturnApply.skuRealPrice
                this.dataForm.reason = data.omsOrderReturnApply.reason
                this.dataForm.description?? = data.omsOrderReturnApply.description??
                this.dataForm.descPics = data.omsOrderReturnApply.descPics
                this.dataForm.handleNote = data.omsOrderReturnApply.handleNote
                this.dataForm.handleMan = data.omsOrderReturnApply.handleMan
                this.dataForm.receiveMan = data.omsOrderReturnApply.receiveMan
                this.dataForm.receiveTime = data.omsOrderReturnApply.receiveTime
                this.dataForm.receiveNote = data.omsOrderReturnApply.receiveNote
                this.dataForm.receivePhone = data.omsOrderReturnApply.receivePhone
                this.dataForm.companyAddress = data.omsOrderReturnApply.companyAddress
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
              url: this.$http.adornUrl(`/order/omsorderreturnapply/${!this.dataForm.id ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'id': this.dataForm.id || undefined,
                'orderId': this.dataForm.orderId,
                'skuId': this.dataForm.skuId,
                'orderSn': this.dataForm.orderSn,
                'createTime': this.dataForm.createTime,
                'memberUsername': this.dataForm.memberUsername,
                'returnAmount': this.dataForm.returnAmount,
                'returnName': this.dataForm.returnName,
                'returnPhone': this.dataForm.returnPhone,
                'status': this.dataForm.status,
                'handleTime': this.dataForm.handleTime,
                'skuImg': this.dataForm.skuImg,
                'skuName': this.dataForm.skuName,
                'skuBrand': this.dataForm.skuBrand,
                'skuAttrsVals': this.dataForm.skuAttrsVals,
                'skuCount': this.dataForm.skuCount,
                'skuPrice': this.dataForm.skuPrice,
                'skuRealPrice': this.dataForm.skuRealPrice,
                'reason': this.dataForm.reason,
                'description??': this.dataForm.description??,
                'descPics': this.dataForm.descPics,
                'handleNote': this.dataForm.handleNote,
                'handleMan': this.dataForm.handleMan,
                'receiveMan': this.dataForm.receiveMan,
                'receiveTime': this.dataForm.receiveTime,
                'receiveNote': this.dataForm.receiveNote,
                'receivePhone': this.dataForm.receivePhone,
                'companyAddress': this.dataForm.companyAddress
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
