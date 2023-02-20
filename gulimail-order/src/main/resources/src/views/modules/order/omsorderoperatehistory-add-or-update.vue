<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
    <el-form-item label="????id" prop="orderId">
      <el-input v-model="dataForm.orderId" placeholder="????id"></el-input>
    </el-form-item>
    <el-form-item label="??????[?û???ϵͳ????̨????Ա]" prop="operateMan">
      <el-input v-model="dataForm.operateMan" placeholder="??????[?û???ϵͳ????̨????Ա]"></el-input>
    </el-form-item>
    <el-form-item label="????ʱ?" prop="createTime">
      <el-input v-model="dataForm.createTime" placeholder="????ʱ?"></el-input>
    </el-form-item>
    <el-form-item label="????״̬??0->?????1->????????2->?ѷ?????3->?????ɣ?4->?ѹرգ?5->??Ч??????" prop="orderStatus">
      <el-input v-model="dataForm.orderStatus" placeholder="????״̬??0->?????1->????????2->?ѷ?????3->?????ɣ?4->?ѹرգ?5->??Ч??????"></el-input>
    </el-form-item>
    <el-form-item label="??ע" prop="note">
      <el-input v-model="dataForm.note" placeholder="??ע"></el-input>
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
          operateMan: '',
          createTime: '',
          orderStatus: '',
          note: ''
        },
        dataRule: {
          orderId: [
            { required: true, message: '????id不能为空', trigger: 'blur' }
          ],
          operateMan: [
            { required: true, message: '??????[?û???ϵͳ????̨????Ա]不能为空', trigger: 'blur' }
          ],
          createTime: [
            { required: true, message: '????ʱ?不能为空', trigger: 'blur' }
          ],
          orderStatus: [
            { required: true, message: '????״̬??0->?????1->????????2->?ѷ?????3->?????ɣ?4->?ѹرգ?5->??Ч??????不能为空', trigger: 'blur' }
          ],
          note: [
            { required: true, message: '??ע不能为空', trigger: 'blur' }
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
              url: this.$http.adornUrl(`/order/omsorderoperatehistory/info/${this.dataForm.id}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.orderId = data.omsOrderOperateHistory.orderId
                this.dataForm.operateMan = data.omsOrderOperateHistory.operateMan
                this.dataForm.createTime = data.omsOrderOperateHistory.createTime
                this.dataForm.orderStatus = data.omsOrderOperateHistory.orderStatus
                this.dataForm.note = data.omsOrderOperateHistory.note
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
              url: this.$http.adornUrl(`/order/omsorderoperatehistory/${!this.dataForm.id ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'id': this.dataForm.id || undefined,
                'orderId': this.dataForm.orderId,
                'operateMan': this.dataForm.operateMan,
                'createTime': this.dataForm.createTime,
                'orderStatus': this.dataForm.orderStatus,
                'note': this.dataForm.note
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
