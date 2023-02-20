<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
    <el-form-item label="??ɱ??????ʱ?ر?ʱ??(??)" prop="flashOrderOvertime">
      <el-input v-model="dataForm.flashOrderOvertime" placeholder="??ɱ??????ʱ?ر?ʱ??(??)"></el-input>
    </el-form-item>
    <el-form-item label="??????????ʱʱ??(??)" prop="normalOrderOvertime">
      <el-input v-model="dataForm.normalOrderOvertime" placeholder="??????????ʱʱ??(??)"></el-input>
    </el-form-item>
    <el-form-item label="???????Զ?ȷ???ջ?ʱ?䣨?죩" prop="confirmOvertime">
      <el-input v-model="dataForm.confirmOvertime" placeholder="???????Զ?ȷ???ջ?ʱ?䣨?죩"></el-input>
    </el-form-item>
    <el-form-item label="?Զ????ɽ???ʱ?䣬?????????˻????죩" prop="finishOvertime">
      <el-input v-model="dataForm.finishOvertime" placeholder="?Զ????ɽ???ʱ?䣬?????????˻????죩"></el-input>
    </el-form-item>
    <el-form-item label="???????ɺ??Զ?????ʱ?䣨?죩" prop="commentOvertime">
      <el-input v-model="dataForm.commentOvertime" placeholder="???????ɺ??Զ?????ʱ?䣨?죩"></el-input>
    </el-form-item>
    <el-form-item label="??Ա?ȼ???0-???޻?Ա?ȼ???ȫ??ͨ?ã?????-??Ӧ????????Ա?ȼ???" prop="memberLevel">
      <el-input v-model="dataForm.memberLevel" placeholder="??Ա?ȼ???0-???޻?Ա?ȼ???ȫ??ͨ?ã?????-??Ӧ????????Ա?ȼ???"></el-input>
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
          flashOrderOvertime: '',
          normalOrderOvertime: '',
          confirmOvertime: '',
          finishOvertime: '',
          commentOvertime: '',
          memberLevel: ''
        },
        dataRule: {
          flashOrderOvertime: [
            { required: true, message: '??ɱ??????ʱ?ر?ʱ??(??)不能为空', trigger: 'blur' }
          ],
          normalOrderOvertime: [
            { required: true, message: '??????????ʱʱ??(??)不能为空', trigger: 'blur' }
          ],
          confirmOvertime: [
            { required: true, message: '???????Զ?ȷ???ջ?ʱ?䣨?죩不能为空', trigger: 'blur' }
          ],
          finishOvertime: [
            { required: true, message: '?Զ????ɽ???ʱ?䣬?????????˻????죩不能为空', trigger: 'blur' }
          ],
          commentOvertime: [
            { required: true, message: '???????ɺ??Զ?????ʱ?䣨?죩不能为空', trigger: 'blur' }
          ],
          memberLevel: [
            { required: true, message: '??Ա?ȼ???0-???޻?Ա?ȼ???ȫ??ͨ?ã?????-??Ӧ????????Ա?ȼ???不能为空', trigger: 'blur' }
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
              url: this.$http.adornUrl(`/order/omsordersetting/info/${this.dataForm.id}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.flashOrderOvertime = data.omsOrderSetting.flashOrderOvertime
                this.dataForm.normalOrderOvertime = data.omsOrderSetting.normalOrderOvertime
                this.dataForm.confirmOvertime = data.omsOrderSetting.confirmOvertime
                this.dataForm.finishOvertime = data.omsOrderSetting.finishOvertime
                this.dataForm.commentOvertime = data.omsOrderSetting.commentOvertime
                this.dataForm.memberLevel = data.omsOrderSetting.memberLevel
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
              url: this.$http.adornUrl(`/order/omsordersetting/${!this.dataForm.id ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'id': this.dataForm.id || undefined,
                'flashOrderOvertime': this.dataForm.flashOrderOvertime,
                'normalOrderOvertime': this.dataForm.normalOrderOvertime,
                'confirmOvertime': this.dataForm.confirmOvertime,
                'finishOvertime': this.dataForm.finishOvertime,
                'commentOvertime': this.dataForm.commentOvertime,
                'memberLevel': this.dataForm.memberLevel
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
