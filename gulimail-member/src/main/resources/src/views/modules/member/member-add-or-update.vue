<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
    <el-form-item label="??Ա?ȼ?id" prop="levelId">
      <el-input v-model="dataForm.levelId" placeholder="??Ա?ȼ?id"></el-input>
    </el-form-item>
    <el-form-item label="?û???" prop="username">
      <el-input v-model="dataForm.username" placeholder="?û???"></el-input>
    </el-form-item>
    <el-form-item label="???" prop="password">
      <el-input v-model="dataForm.password" placeholder="???"></el-input>
    </el-form-item>
    <el-form-item label="?ǳ" prop="nickname">
      <el-input v-model="dataForm.nickname" placeholder="?ǳ"></el-input>
    </el-form-item>
    <el-form-item label="?ֻ????" prop="mobile">
      <el-input v-model="dataForm.mobile" placeholder="?ֻ????"></el-input>
    </el-form-item>
    <el-form-item label="???" prop="email">
      <el-input v-model="dataForm.email" placeholder="???"></el-input>
    </el-form-item>
    <el-form-item label="ͷ?" prop="header">
      <el-input v-model="dataForm.header" placeholder="ͷ?"></el-input>
    </el-form-item>
    <el-form-item label="?Ա" prop="gender">
      <el-input v-model="dataForm.gender" placeholder="?Ա"></el-input>
    </el-form-item>
    <el-form-item label="???" prop="birth">
      <el-input v-model="dataForm.birth" placeholder="???"></el-input>
    </el-form-item>
    <el-form-item label="???ڳ??" prop="city">
      <el-input v-model="dataForm.city" placeholder="???ڳ??"></el-input>
    </el-form-item>
    <el-form-item label="ְҵ" prop="job">
      <el-input v-model="dataForm.job" placeholder="ְҵ"></el-input>
    </el-form-item>
    <el-form-item label="????ǩ??" prop="sign">
      <el-input v-model="dataForm.sign" placeholder="????ǩ??"></el-input>
    </el-form-item>
    <el-form-item label="?û???Դ" prop="sourceType">
      <el-input v-model="dataForm.sourceType" placeholder="?û???Դ"></el-input>
    </el-form-item>
    <el-form-item label="???" prop="integration">
      <el-input v-model="dataForm.integration" placeholder="???"></el-input>
    </el-form-item>
    <el-form-item label="?ɳ?ֵ" prop="growth">
      <el-input v-model="dataForm.growth" placeholder="?ɳ?ֵ"></el-input>
    </el-form-item>
    <el-form-item label="????״̬" prop="status">
      <el-input v-model="dataForm.status" placeholder="????״̬"></el-input>
    </el-form-item>
    <el-form-item label="ע??ʱ?" prop="createTime">
      <el-input v-model="dataForm.createTime" placeholder="ע??ʱ?"></el-input>
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
          levelId: '',
          username: '',
          password: '',
          nickname: '',
          mobile: '',
          email: '',
          header: '',
          gender: '',
          birth: '',
          city: '',
          job: '',
          sign: '',
          sourceType: '',
          integration: '',
          growth: '',
          status: '',
          createTime: ''
        },
        dataRule: {
          levelId: [
            { required: true, message: '??Ա?ȼ?id不能为空', trigger: 'blur' }
          ],
          username: [
            { required: true, message: '?û???不能为空', trigger: 'blur' }
          ],
          password: [
            { required: true, message: '???不能为空', trigger: 'blur' }
          ],
          nickname: [
            { required: true, message: '?ǳ不能为空', trigger: 'blur' }
          ],
          mobile: [
            { required: true, message: '?ֻ????不能为空', trigger: 'blur' }
          ],
          email: [
            { required: true, message: '???不能为空', trigger: 'blur' }
          ],
          header: [
            { required: true, message: 'ͷ?不能为空', trigger: 'blur' }
          ],
          gender: [
            { required: true, message: '?Ա不能为空', trigger: 'blur' }
          ],
          birth: [
            { required: true, message: '???不能为空', trigger: 'blur' }
          ],
          city: [
            { required: true, message: '???ڳ??不能为空', trigger: 'blur' }
          ],
          job: [
            { required: true, message: 'ְҵ不能为空', trigger: 'blur' }
          ],
          sign: [
            { required: true, message: '????ǩ??不能为空', trigger: 'blur' }
          ],
          sourceType: [
            { required: true, message: '?û???Դ不能为空', trigger: 'blur' }
          ],
          integration: [
            { required: true, message: '???不能为空', trigger: 'blur' }
          ],
          growth: [
            { required: true, message: '?ɳ?ֵ不能为空', trigger: 'blur' }
          ],
          status: [
            { required: true, message: '????״̬不能为空', trigger: 'blur' }
          ],
          createTime: [
            { required: true, message: 'ע??ʱ?不能为空', trigger: 'blur' }
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
              url: this.$http.adornUrl(`/member/member/info/${this.dataForm.id}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.levelId = data.member.levelId
                this.dataForm.username = data.member.username
                this.dataForm.password = data.member.password
                this.dataForm.nickname = data.member.nickname
                this.dataForm.mobile = data.member.mobile
                this.dataForm.email = data.member.email
                this.dataForm.header = data.member.header
                this.dataForm.gender = data.member.gender
                this.dataForm.birth = data.member.birth
                this.dataForm.city = data.member.city
                this.dataForm.job = data.member.job
                this.dataForm.sign = data.member.sign
                this.dataForm.sourceType = data.member.sourceType
                this.dataForm.integration = data.member.integration
                this.dataForm.growth = data.member.growth
                this.dataForm.status = data.member.status
                this.dataForm.createTime = data.member.createTime
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
              url: this.$http.adornUrl(`/member/member/${!this.dataForm.id ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'id': this.dataForm.id || undefined,
                'levelId': this.dataForm.levelId,
                'username': this.dataForm.username,
                'password': this.dataForm.password,
                'nickname': this.dataForm.nickname,
                'mobile': this.dataForm.mobile,
                'email': this.dataForm.email,
                'header': this.dataForm.header,
                'gender': this.dataForm.gender,
                'birth': this.dataForm.birth,
                'city': this.dataForm.city,
                'job': this.dataForm.job,
                'sign': this.dataForm.sign,
                'sourceType': this.dataForm.sourceType,
                'integration': this.dataForm.integration,
                'growth': this.dataForm.growth,
                'status': this.dataForm.status,
                'createTime': this.dataForm.createTime
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
