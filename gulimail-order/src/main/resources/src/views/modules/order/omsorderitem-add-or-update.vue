<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
    <el-form-item label="order_id" prop="orderId">
      <el-input v-model="dataForm.orderId" placeholder="order_id"></el-input>
    </el-form-item>
    <el-form-item label="order_sn" prop="orderSn">
      <el-input v-model="dataForm.orderSn" placeholder="order_sn"></el-input>
    </el-form-item>
    <el-form-item label="spu_id" prop="spuId">
      <el-input v-model="dataForm.spuId" placeholder="spu_id"></el-input>
    </el-form-item>
    <el-form-item label="spu_name" prop="spuName">
      <el-input v-model="dataForm.spuName" placeholder="spu_name"></el-input>
    </el-form-item>
    <el-form-item label="spu_pic" prop="spuPic">
      <el-input v-model="dataForm.spuPic" placeholder="spu_pic"></el-input>
    </el-form-item>
    <el-form-item label="Ʒ?" prop="spuBrand">
      <el-input v-model="dataForm.spuBrand" placeholder="Ʒ?"></el-input>
    </el-form-item>
    <el-form-item label="??Ʒ????id" prop="categoryId">
      <el-input v-model="dataForm.categoryId" placeholder="??Ʒ????id"></el-input>
    </el-form-item>
    <el-form-item label="??Ʒsku???" prop="skuId">
      <el-input v-model="dataForm.skuId" placeholder="??Ʒsku???"></el-input>
    </el-form-item>
    <el-form-item label="??Ʒsku???" prop="skuName">
      <el-input v-model="dataForm.skuName" placeholder="??Ʒsku???"></el-input>
    </el-form-item>
    <el-form-item label="??ƷskuͼƬ" prop="skuPic">
      <el-input v-model="dataForm.skuPic" placeholder="??ƷskuͼƬ"></el-input>
    </el-form-item>
    <el-form-item label="??Ʒsku?۸" prop="skuPrice">
      <el-input v-model="dataForm.skuPrice" placeholder="??Ʒsku?۸"></el-input>
    </el-form-item>
    <el-form-item label="??Ʒ??????????" prop="skuQuantity">
      <el-input v-model="dataForm.skuQuantity" placeholder="??Ʒ??????????"></el-input>
    </el-form-item>
    <el-form-item label="??Ʒ???????????ϣ?JSON??" prop="skuAttrsVals">
      <el-input v-model="dataForm.skuAttrsVals" placeholder="??Ʒ???????????ϣ?JSON??"></el-input>
    </el-form-item>
    <el-form-item label="??Ʒ?????ֽ??" prop="promotionAmount">
      <el-input v-model="dataForm.promotionAmount" placeholder="??Ʒ?????ֽ??"></el-input>
    </el-form-item>
    <el-form-item label="?Ż?ȯ?Żݷֽ??" prop="couponAmount">
      <el-input v-model="dataForm.couponAmount" placeholder="?Ż?ȯ?Żݷֽ??"></el-input>
    </el-form-item>
    <el-form-item label="?????Żݷֽ??" prop="integrationAmount">
      <el-input v-model="dataForm.integrationAmount" placeholder="?????Żݷֽ??"></el-input>
    </el-form-item>
    <el-form-item label="????Ʒ?????Żݺ??ķֽ??" prop="realAmount">
      <el-input v-model="dataForm.realAmount" placeholder="????Ʒ?????Żݺ??ķֽ??"></el-input>
    </el-form-item>
    <el-form-item label="???ͻ??" prop="giftIntegration">
      <el-input v-model="dataForm.giftIntegration" placeholder="???ͻ??"></el-input>
    </el-form-item>
    <el-form-item label="???ͳɳ?ֵ" prop="giftGrowth">
      <el-input v-model="dataForm.giftGrowth" placeholder="???ͳɳ?ֵ"></el-input>
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
          orderSn: '',
          spuId: '',
          spuName: '',
          spuPic: '',
          spuBrand: '',
          categoryId: '',
          skuId: '',
          skuName: '',
          skuPic: '',
          skuPrice: '',
          skuQuantity: '',
          skuAttrsVals: '',
          promotionAmount: '',
          couponAmount: '',
          integrationAmount: '',
          realAmount: '',
          giftIntegration: '',
          giftGrowth: ''
        },
        dataRule: {
          orderId: [
            { required: true, message: 'order_id不能为空', trigger: 'blur' }
          ],
          orderSn: [
            { required: true, message: 'order_sn不能为空', trigger: 'blur' }
          ],
          spuId: [
            { required: true, message: 'spu_id不能为空', trigger: 'blur' }
          ],
          spuName: [
            { required: true, message: 'spu_name不能为空', trigger: 'blur' }
          ],
          spuPic: [
            { required: true, message: 'spu_pic不能为空', trigger: 'blur' }
          ],
          spuBrand: [
            { required: true, message: 'Ʒ?不能为空', trigger: 'blur' }
          ],
          categoryId: [
            { required: true, message: '??Ʒ????id不能为空', trigger: 'blur' }
          ],
          skuId: [
            { required: true, message: '??Ʒsku???不能为空', trigger: 'blur' }
          ],
          skuName: [
            { required: true, message: '??Ʒsku???不能为空', trigger: 'blur' }
          ],
          skuPic: [
            { required: true, message: '??ƷskuͼƬ不能为空', trigger: 'blur' }
          ],
          skuPrice: [
            { required: true, message: '??Ʒsku?۸不能为空', trigger: 'blur' }
          ],
          skuQuantity: [
            { required: true, message: '??Ʒ??????????不能为空', trigger: 'blur' }
          ],
          skuAttrsVals: [
            { required: true, message: '??Ʒ???????????ϣ?JSON??不能为空', trigger: 'blur' }
          ],
          promotionAmount: [
            { required: true, message: '??Ʒ?????ֽ??不能为空', trigger: 'blur' }
          ],
          couponAmount: [
            { required: true, message: '?Ż?ȯ?Żݷֽ??不能为空', trigger: 'blur' }
          ],
          integrationAmount: [
            { required: true, message: '?????Żݷֽ??不能为空', trigger: 'blur' }
          ],
          realAmount: [
            { required: true, message: '????Ʒ?????Żݺ??ķֽ??不能为空', trigger: 'blur' }
          ],
          giftIntegration: [
            { required: true, message: '???ͻ??不能为空', trigger: 'blur' }
          ],
          giftGrowth: [
            { required: true, message: '???ͳɳ?ֵ不能为空', trigger: 'blur' }
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
              url: this.$http.adornUrl(`/order/omsorderitem/info/${this.dataForm.id}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.orderId = data.omsOrderItem.orderId
                this.dataForm.orderSn = data.omsOrderItem.orderSn
                this.dataForm.spuId = data.omsOrderItem.spuId
                this.dataForm.spuName = data.omsOrderItem.spuName
                this.dataForm.spuPic = data.omsOrderItem.spuPic
                this.dataForm.spuBrand = data.omsOrderItem.spuBrand
                this.dataForm.categoryId = data.omsOrderItem.categoryId
                this.dataForm.skuId = data.omsOrderItem.skuId
                this.dataForm.skuName = data.omsOrderItem.skuName
                this.dataForm.skuPic = data.omsOrderItem.skuPic
                this.dataForm.skuPrice = data.omsOrderItem.skuPrice
                this.dataForm.skuQuantity = data.omsOrderItem.skuQuantity
                this.dataForm.skuAttrsVals = data.omsOrderItem.skuAttrsVals
                this.dataForm.promotionAmount = data.omsOrderItem.promotionAmount
                this.dataForm.couponAmount = data.omsOrderItem.couponAmount
                this.dataForm.integrationAmount = data.omsOrderItem.integrationAmount
                this.dataForm.realAmount = data.omsOrderItem.realAmount
                this.dataForm.giftIntegration = data.omsOrderItem.giftIntegration
                this.dataForm.giftGrowth = data.omsOrderItem.giftGrowth
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
              url: this.$http.adornUrl(`/order/omsorderitem/${!this.dataForm.id ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'id': this.dataForm.id || undefined,
                'orderId': this.dataForm.orderId,
                'orderSn': this.dataForm.orderSn,
                'spuId': this.dataForm.spuId,
                'spuName': this.dataForm.spuName,
                'spuPic': this.dataForm.spuPic,
                'spuBrand': this.dataForm.spuBrand,
                'categoryId': this.dataForm.categoryId,
                'skuId': this.dataForm.skuId,
                'skuName': this.dataForm.skuName,
                'skuPic': this.dataForm.skuPic,
                'skuPrice': this.dataForm.skuPrice,
                'skuQuantity': this.dataForm.skuQuantity,
                'skuAttrsVals': this.dataForm.skuAttrsVals,
                'promotionAmount': this.dataForm.promotionAmount,
                'couponAmount': this.dataForm.couponAmount,
                'integrationAmount': this.dataForm.integrationAmount,
                'realAmount': this.dataForm.realAmount,
                'giftIntegration': this.dataForm.giftIntegration,
                'giftGrowth': this.dataForm.giftGrowth
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
