<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
    <el-form-item label="member_id" prop="memberId">
      <el-input v-model="dataForm.memberId" placeholder="member_id"></el-input>
    </el-form-item>
    <el-form-item label="create_time" prop="createTime">
      <el-input v-model="dataForm.createTime" placeholder="create_time"></el-input>
    </el-form-item>
    <el-form-item label="?仯??ֵ" prop="changeCount">
      <el-input v-model="dataForm.changeCount" placeholder="?仯??ֵ"></el-input>
    </el-form-item>
    <el-form-item label="??ע" prop="note">
      <el-input v-model="dataForm.note" placeholder="??ע"></el-input>
    </el-form-item>
    <el-form-item label="??Դ[0->???1->????Ա?޸?;2->?]" prop="sourceTyoe">
      <el-input v-model="dataForm.sourceTyoe" placeholder="??Դ[0->???1->????Ա?޸?;2->?]"></el-input>
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
          createTime: '',
          changeCount: '',
          note: '',
          sourceTyoe: ''
        },
        dataRule: {
          memberId: [
            { required: true, message: 'member_id不能为空', trigger: 'blur' }
          ],
          createTime: [
            { required: true, message: 'create_time不能为空', trigger: 'blur' }
          ],
          changeCount: [
            { required: true, message: '?仯??ֵ不能为空', trigger: 'blur' }
          ],
          note: [
            { required: true, message: '??ע不能为空', trigger: 'blur' }
          ],
          sourceTyoe: [
            { required: true, message: '??Դ[0->???1->????Ա?޸?;2->?]不能为空', trigger: 'blur' }
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
              url: this.$http.adornUrl(`/member/integrationchangehistory/info/${this.dataForm.id}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.memberId = data.integrationChangeHistory.memberId
                this.dataForm.createTime = data.integrationChangeHistory.createTime
                this.dataForm.changeCount = data.integrationChangeHistory.changeCount
                this.dataForm.note = data.integrationChangeHistory.note
                this.dataForm.sourceTyoe = data.integrationChangeHistory.sourceTyoe
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
              url: this.$http.adornUrl(`/member/integrationchangehistory/${!this.dataForm.id ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'id': this.dataForm.id || undefined,
                'memberId': this.dataForm.memberId,
                'createTime': this.dataForm.createTime,
                'changeCount': this.dataForm.changeCount,
                'note': this.dataForm.note,
                'sourceTyoe': this.dataForm.sourceTyoe
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
