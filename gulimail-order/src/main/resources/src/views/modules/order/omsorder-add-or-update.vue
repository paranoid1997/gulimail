<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
    <el-form-item label="member_id" prop="memberId">
      <el-input v-model="dataForm.memberId" placeholder="member_id"></el-input>
    </el-form-item>
    <el-form-item label="?????" prop="orderSn">
      <el-input v-model="dataForm.orderSn" placeholder="?????"></el-input>
    </el-form-item>
    <el-form-item label="ʹ?õ??Ż?ȯ" prop="couponId">
      <el-input v-model="dataForm.couponId" placeholder="ʹ?õ??Ż?ȯ"></el-input>
    </el-form-item>
    <el-form-item label="create_time" prop="createTime">
      <el-input v-model="dataForm.createTime" placeholder="create_time"></el-input>
    </el-form-item>
    <el-form-item label="?û???" prop="memberUsername">
      <el-input v-model="dataForm.memberUsername" placeholder="?û???"></el-input>
    </el-form-item>
    <el-form-item label="?????ܶ" prop="totalAmount">
      <el-input v-model="dataForm.totalAmount" placeholder="?????ܶ"></el-input>
    </el-form-item>
    <el-form-item label="Ӧ???ܶ" prop="payAmount">
      <el-input v-model="dataForm.payAmount" placeholder="Ӧ???ܶ"></el-input>
    </el-form-item>
    <el-form-item label="?˷ѽ" prop="freightAmount">
      <el-input v-model="dataForm.freightAmount" placeholder="?˷ѽ"></el-input>
    </el-form-item>
    <el-form-item label="?????Ż?????????ۡ??????????ݼۣ?" prop="promotionAmount">
      <el-input v-model="dataForm.promotionAmount" placeholder="?????Ż?????????ۡ??????????ݼۣ?"></el-input>
    </el-form-item>
    <el-form-item label="???ֵֿ۽" prop="integrationAmount">
      <el-input v-model="dataForm.integrationAmount" placeholder="???ֵֿ۽"></el-input>
    </el-form-item>
    <el-form-item label="?Ż?ȯ?ֿ۽" prop="couponAmount">
      <el-input v-model="dataForm.couponAmount" placeholder="?Ż?ȯ?ֿ۽"></el-input>
    </el-form-item>
    <el-form-item label="??̨????????ʹ?õ??ۿ۽" prop="discountAmount">
      <el-input v-model="dataForm.discountAmount" placeholder="??̨????????ʹ?õ??ۿ۽"></el-input>
    </el-form-item>
    <el-form-item label="֧????ʽ??1->֧??????2->΢?ţ?3->?????? 4->?????????" prop="payType">
      <el-input v-model="dataForm.payType" placeholder="֧????ʽ??1->֧??????2->΢?ţ?3->?????? 4->?????????"></el-input>
    </el-form-item>
    <el-form-item label="??????Դ[0->PC??????1->app????]" prop="sourceType">
      <el-input v-model="dataForm.sourceType" placeholder="??????Դ[0->PC??????1->app????]"></el-input>
    </el-form-item>
    <el-form-item label="????״̬??0->?????1->????????2->?ѷ?????3->?????ɣ?4->?ѹرգ?5->??Ч??????" prop="status">
      <el-input v-model="dataForm.status" placeholder="????״̬??0->?????1->????????2->?ѷ?????3->?????ɣ?4->?ѹرգ?5->??Ч??????"></el-input>
    </el-form-item>
    <el-form-item label="??????˾(???ͷ?ʽ)" prop="deliveryCompany">
      <el-input v-model="dataForm.deliveryCompany" placeholder="??????˾(???ͷ?ʽ)"></el-input>
    </el-form-item>
    <el-form-item label="???????" prop="deliverySn">
      <el-input v-model="dataForm.deliverySn" placeholder="???????"></el-input>
    </el-form-item>
    <el-form-item label="?Զ?ȷ??ʱ?䣨?죩" prop="autoConfirmDay">
      <el-input v-model="dataForm.autoConfirmDay" placeholder="?Զ?ȷ??ʱ?䣨?죩"></el-input>
    </el-form-item>
    <el-form-item label="???Ի??õĻ??" prop="integration">
      <el-input v-model="dataForm.integration" placeholder="???Ի??õĻ??"></el-input>
    </el-form-item>
    <el-form-item label="???Ի??õĳɳ?ֵ" prop="growth">
      <el-input v-model="dataForm.growth" placeholder="???Ի??õĳɳ?ֵ"></el-input>
    </el-form-item>
    <el-form-item label="??Ʊ????[0->??????Ʊ??1->???ӷ?Ʊ??2->ֽ?ʷ?Ʊ]" prop="billType">
      <el-input v-model="dataForm.billType" placeholder="??Ʊ????[0->??????Ʊ??1->???ӷ?Ʊ??2->ֽ?ʷ?Ʊ]"></el-input>
    </el-form-item>
    <el-form-item label="??Ʊ̧ͷ" prop="billHeader">
      <el-input v-model="dataForm.billHeader" placeholder="??Ʊ̧ͷ"></el-input>
    </el-form-item>
    <el-form-item label="??Ʊ???" prop="billContent">
      <el-input v-model="dataForm.billContent" placeholder="??Ʊ???"></el-input>
    </el-form-item>
    <el-form-item label="??Ʊ?˵绰" prop="billReceiverPhone">
      <el-input v-model="dataForm.billReceiverPhone" placeholder="??Ʊ?˵绰"></el-input>
    </el-form-item>
    <el-form-item label="??Ʊ?????" prop="billReceiverEmail">
      <el-input v-model="dataForm.billReceiverEmail" placeholder="??Ʊ?????"></el-input>
    </el-form-item>
    <el-form-item label="?ջ???????" prop="receiverName">
      <el-input v-model="dataForm.receiverName" placeholder="?ջ???????"></el-input>
    </el-form-item>
    <el-form-item label="?ջ??˵绰" prop="receiverPhone">
      <el-input v-model="dataForm.receiverPhone" placeholder="?ջ??˵绰"></el-input>
    </el-form-item>
    <el-form-item label="?ջ????ʱ" prop="receiverPostCode">
      <el-input v-model="dataForm.receiverPostCode" placeholder="?ջ????ʱ"></el-input>
    </el-form-item>
    <el-form-item label="ʡ??/ֱϽ?" prop="receiverProvince">
      <el-input v-model="dataForm.receiverProvince" placeholder="ʡ??/ֱϽ?"></el-input>
    </el-form-item>
    <el-form-item label="???" prop="receiverCity">
      <el-input v-model="dataForm.receiverCity" placeholder="???"></el-input>
    </el-form-item>
    <el-form-item label="??" prop="receiverRegion">
      <el-input v-model="dataForm.receiverRegion" placeholder="??"></el-input>
    </el-form-item>
    <el-form-item label="??ϸ??ַ" prop="receiverDetailAddress">
      <el-input v-model="dataForm.receiverDetailAddress" placeholder="??ϸ??ַ"></el-input>
    </el-form-item>
    <el-form-item label="??????ע" prop="note">
      <el-input v-model="dataForm.note" placeholder="??????ע"></el-input>
    </el-form-item>
    <el-form-item label="ȷ???ջ?״̬[0->δȷ?ϣ?1->??ȷ??]" prop="confirmStatus">
      <el-input v-model="dataForm.confirmStatus" placeholder="ȷ???ջ?״̬[0->δȷ?ϣ?1->??ȷ??]"></el-input>
    </el-form-item>
    <el-form-item label="ɾ??״̬??0->δɾ????1->??ɾ????" prop="deleteStatus">
      <el-input v-model="dataForm.deleteStatus" placeholder="ɾ??״̬??0->δɾ????1->??ɾ????"></el-input>
    </el-form-item>
    <el-form-item label="?µ?ʱʹ?õĻ??" prop="useIntegration">
      <el-input v-model="dataForm.useIntegration" placeholder="?µ?ʱʹ?õĻ??"></el-input>
    </el-form-item>
    <el-form-item label="֧??ʱ?" prop="paymentTime">
      <el-input v-model="dataForm.paymentTime" placeholder="֧??ʱ?"></el-input>
    </el-form-item>
    <el-form-item label="????ʱ?" prop="deliveryTime">
      <el-input v-model="dataForm.deliveryTime" placeholder="????ʱ?"></el-input>
    </el-form-item>
    <el-form-item label="ȷ???ջ?ʱ?" prop="receiveTime">
      <el-input v-model="dataForm.receiveTime" placeholder="ȷ???ջ?ʱ?"></el-input>
    </el-form-item>
    <el-form-item label="????ʱ?" prop="commentTime">
      <el-input v-model="dataForm.commentTime" placeholder="????ʱ?"></el-input>
    </el-form-item>
    <el-form-item label="?޸?ʱ?" prop="modifyTime">
      <el-input v-model="dataForm.modifyTime" placeholder="?޸?ʱ?"></el-input>
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
          memberId: '',
          orderSn: '',
          couponId: '',
          createTime: '',
          memberUsername: '',
          totalAmount: '',
          payAmount: '',
          freightAmount: '',
          promotionAmount: '',
          integrationAmount: '',
          couponAmount: '',
          discountAmount: '',
          payType: '',
          sourceType: '',
          status: '',
          deliveryCompany: '',
          deliverySn: '',
          autoConfirmDay: '',
          integration: '',
          growth: '',
          billType: '',
          billHeader: '',
          billContent: '',
          billReceiverPhone: '',
          billReceiverEmail: '',
          receiverName: '',
          receiverPhone: '',
          receiverPostCode: '',
          receiverProvince: '',
          receiverCity: '',
          receiverRegion: '',
          receiverDetailAddress: '',
          note: '',
          confirmStatus: '',
          deleteStatus: '',
          useIntegration: '',
          paymentTime: '',
          deliveryTime: '',
          receiveTime: '',
          commentTime: '',
          modifyTime: ''
        },
        dataRule: {
          memberId: [
            { required: true, message: 'member_id不能为空', trigger: 'blur' }
          ],
          orderSn: [
            { required: true, message: '?????不能为空', trigger: 'blur' }
          ],
          couponId: [
            { required: true, message: 'ʹ?õ??Ż?ȯ不能为空', trigger: 'blur' }
          ],
          createTime: [
            { required: true, message: 'create_time不能为空', trigger: 'blur' }
          ],
          memberUsername: [
            { required: true, message: '?û???不能为空', trigger: 'blur' }
          ],
          totalAmount: [
            { required: true, message: '?????ܶ不能为空', trigger: 'blur' }
          ],
          payAmount: [
            { required: true, message: 'Ӧ???ܶ不能为空', trigger: 'blur' }
          ],
          freightAmount: [
            { required: true, message: '?˷ѽ不能为空', trigger: 'blur' }
          ],
          promotionAmount: [
            { required: true, message: '?????Ż?????????ۡ??????????ݼۣ?不能为空', trigger: 'blur' }
          ],
          integrationAmount: [
            { required: true, message: '???ֵֿ۽不能为空', trigger: 'blur' }
          ],
          couponAmount: [
            { required: true, message: '?Ż?ȯ?ֿ۽不能为空', trigger: 'blur' }
          ],
          discountAmount: [
            { required: true, message: '??̨????????ʹ?õ??ۿ۽不能为空', trigger: 'blur' }
          ],
          payType: [
            { required: true, message: '֧????ʽ??1->֧??????2->΢?ţ?3->?????? 4->?????????不能为空', trigger: 'blur' }
          ],
          sourceType: [
            { required: true, message: '??????Դ[0->PC??????1->app????]不能为空', trigger: 'blur' }
          ],
          status: [
            { required: true, message: '????״̬??0->?????1->????????2->?ѷ?????3->?????ɣ?4->?ѹرգ?5->??Ч??????不能为空', trigger: 'blur' }
          ],
          deliveryCompany: [
            { required: true, message: '??????˾(???ͷ?ʽ)不能为空', trigger: 'blur' }
          ],
          deliverySn: [
            { required: true, message: '???????不能为空', trigger: 'blur' }
          ],
          autoConfirmDay: [
            { required: true, message: '?Զ?ȷ??ʱ?䣨?죩不能为空', trigger: 'blur' }
          ],
          integration: [
            { required: true, message: '???Ի??õĻ??不能为空', trigger: 'blur' }
          ],
          growth: [
            { required: true, message: '???Ի??õĳɳ?ֵ不能为空', trigger: 'blur' }
          ],
          billType: [
            { required: true, message: '??Ʊ????[0->??????Ʊ??1->???ӷ?Ʊ??2->ֽ?ʷ?Ʊ]不能为空', trigger: 'blur' }
          ],
          billHeader: [
            { required: true, message: '??Ʊ̧ͷ不能为空', trigger: 'blur' }
          ],
          billContent: [
            { required: true, message: '??Ʊ???不能为空', trigger: 'blur' }
          ],
          billReceiverPhone: [
            { required: true, message: '??Ʊ?˵绰不能为空', trigger: 'blur' }
          ],
          billReceiverEmail: [
            { required: true, message: '??Ʊ?????不能为空', trigger: 'blur' }
          ],
          receiverName: [
            { required: true, message: '?ջ???????不能为空', trigger: 'blur' }
          ],
          receiverPhone: [
            { required: true, message: '?ջ??˵绰不能为空', trigger: 'blur' }
          ],
          receiverPostCode: [
            { required: true, message: '?ջ????ʱ不能为空', trigger: 'blur' }
          ],
          receiverProvince: [
            { required: true, message: 'ʡ??/ֱϽ?不能为空', trigger: 'blur' }
          ],
          receiverCity: [
            { required: true, message: '???不能为空', trigger: 'blur' }
          ],
          receiverRegion: [
            { required: true, message: '??不能为空', trigger: 'blur' }
          ],
          receiverDetailAddress: [
            { required: true, message: '??ϸ??ַ不能为空', trigger: 'blur' }
          ],
          note: [
            { required: true, message: '??????ע不能为空', trigger: 'blur' }
          ],
          confirmStatus: [
            { required: true, message: 'ȷ???ջ?״̬[0->δȷ?ϣ?1->??ȷ??]不能为空', trigger: 'blur' }
          ],
          deleteStatus: [
            { required: true, message: 'ɾ??״̬??0->δɾ????1->??ɾ????不能为空', trigger: 'blur' }
          ],
          useIntegration: [
            { required: true, message: '?µ?ʱʹ?õĻ??不能为空', trigger: 'blur' }
          ],
          paymentTime: [
            { required: true, message: '֧??ʱ?不能为空', trigger: 'blur' }
          ],
          deliveryTime: [
            { required: true, message: '????ʱ?不能为空', trigger: 'blur' }
          ],
          receiveTime: [
            { required: true, message: 'ȷ???ջ?ʱ?不能为空', trigger: 'blur' }
          ],
          commentTime: [
            { required: true, message: '????ʱ?不能为空', trigger: 'blur' }
          ],
          modifyTime: [
            { required: true, message: '?޸?ʱ?不能为空', trigger: 'blur' }
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
              url: this.$http.adornUrl(`/order/omsorder/info/${this.dataForm.id}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.memberId = data.omsOrder.memberId
                this.dataForm.orderSn = data.omsOrder.orderSn
                this.dataForm.couponId = data.omsOrder.couponId
                this.dataForm.createTime = data.omsOrder.createTime
                this.dataForm.memberUsername = data.omsOrder.memberUsername
                this.dataForm.totalAmount = data.omsOrder.totalAmount
                this.dataForm.payAmount = data.omsOrder.payAmount
                this.dataForm.freightAmount = data.omsOrder.freightAmount
                this.dataForm.promotionAmount = data.omsOrder.promotionAmount
                this.dataForm.integrationAmount = data.omsOrder.integrationAmount
                this.dataForm.couponAmount = data.omsOrder.couponAmount
                this.dataForm.discountAmount = data.omsOrder.discountAmount
                this.dataForm.payType = data.omsOrder.payType
                this.dataForm.sourceType = data.omsOrder.sourceType
                this.dataForm.status = data.omsOrder.status
                this.dataForm.deliveryCompany = data.omsOrder.deliveryCompany
                this.dataForm.deliverySn = data.omsOrder.deliverySn
                this.dataForm.autoConfirmDay = data.omsOrder.autoConfirmDay
                this.dataForm.integration = data.omsOrder.integration
                this.dataForm.growth = data.omsOrder.growth
                this.dataForm.billType = data.omsOrder.billType
                this.dataForm.billHeader = data.omsOrder.billHeader
                this.dataForm.billContent = data.omsOrder.billContent
                this.dataForm.billReceiverPhone = data.omsOrder.billReceiverPhone
                this.dataForm.billReceiverEmail = data.omsOrder.billReceiverEmail
                this.dataForm.receiverName = data.omsOrder.receiverName
                this.dataForm.receiverPhone = data.omsOrder.receiverPhone
                this.dataForm.receiverPostCode = data.omsOrder.receiverPostCode
                this.dataForm.receiverProvince = data.omsOrder.receiverProvince
                this.dataForm.receiverCity = data.omsOrder.receiverCity
                this.dataForm.receiverRegion = data.omsOrder.receiverRegion
                this.dataForm.receiverDetailAddress = data.omsOrder.receiverDetailAddress
                this.dataForm.note = data.omsOrder.note
                this.dataForm.confirmStatus = data.omsOrder.confirmStatus
                this.dataForm.deleteStatus = data.omsOrder.deleteStatus
                this.dataForm.useIntegration = data.omsOrder.useIntegration
                this.dataForm.paymentTime = data.omsOrder.paymentTime
                this.dataForm.deliveryTime = data.omsOrder.deliveryTime
                this.dataForm.receiveTime = data.omsOrder.receiveTime
                this.dataForm.commentTime = data.omsOrder.commentTime
                this.dataForm.modifyTime = data.omsOrder.modifyTime
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
              url: this.$http.adornUrl(`/order/omsorder/${!this.dataForm.id ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'id': this.dataForm.id || undefined,
                'memberId': this.dataForm.memberId,
                'orderSn': this.dataForm.orderSn,
                'couponId': this.dataForm.couponId,
                'createTime': this.dataForm.createTime,
                'memberUsername': this.dataForm.memberUsername,
                'totalAmount': this.dataForm.totalAmount,
                'payAmount': this.dataForm.payAmount,
                'freightAmount': this.dataForm.freightAmount,
                'promotionAmount': this.dataForm.promotionAmount,
                'integrationAmount': this.dataForm.integrationAmount,
                'couponAmount': this.dataForm.couponAmount,
                'discountAmount': this.dataForm.discountAmount,
                'payType': this.dataForm.payType,
                'sourceType': this.dataForm.sourceType,
                'status': this.dataForm.status,
                'deliveryCompany': this.dataForm.deliveryCompany,
                'deliverySn': this.dataForm.deliverySn,
                'autoConfirmDay': this.dataForm.autoConfirmDay,
                'integration': this.dataForm.integration,
                'growth': this.dataForm.growth,
                'billType': this.dataForm.billType,
                'billHeader': this.dataForm.billHeader,
                'billContent': this.dataForm.billContent,
                'billReceiverPhone': this.dataForm.billReceiverPhone,
                'billReceiverEmail': this.dataForm.billReceiverEmail,
                'receiverName': this.dataForm.receiverName,
                'receiverPhone': this.dataForm.receiverPhone,
                'receiverPostCode': this.dataForm.receiverPostCode,
                'receiverProvince': this.dataForm.receiverProvince,
                'receiverCity': this.dataForm.receiverCity,
                'receiverRegion': this.dataForm.receiverRegion,
                'receiverDetailAddress': this.dataForm.receiverDetailAddress,
                'note': this.dataForm.note,
                'confirmStatus': this.dataForm.confirmStatus,
                'deleteStatus': this.dataForm.deleteStatus,
                'useIntegration': this.dataForm.useIntegration,
                'paymentTime': this.dataForm.paymentTime,
                'deliveryTime': this.dataForm.deliveryTime,
                'receiveTime': this.dataForm.receiveTime,
                'commentTime': this.dataForm.commentTime,
                'modifyTime': this.dataForm.modifyTime
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
