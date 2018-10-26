<template>
  <q-layout view="lHh Lpr lFf">
    <q-layout-header>
      <q-toolbar
        color="primary"
        :glossy="$q.theme === 'mat'"
        :inverted="$q.theme === 'ios'"
      >
        <q-btn
          flat
          dense
          round
          @click="leftDrawerOpen = !leftDrawerOpen"
          aria-label="Menu"
        >
          <q-icon name="menu" />
        </q-btn>

        <q-toolbar-title>
          아단전
          <div slot="subtitle">아이티 프리랜서 단가 전선</div>
        </q-toolbar-title>
      </q-toolbar>
    </q-layout-header>

    <q-layout-drawer
      v-model="leftDrawerOpen"
      :content-class="$q.theme === 'mat' ? 'bg-grey-2' : null"
    >
      <q-list
        no-border
        link
        inset-delimiter
      >
        <q-list-header>아단전 링크</q-list-header>
        <!--<q-item @click.native="openURL('http://quasar-framework.org')">-->
          <!--<q-item-side icon="school" />-->
          <!--<q-item-main label="Docs" sublabel="quasar-framework.org" />-->
        <!--</q-item>-->
        <q-item @click.native="openURL('https://github.com/quasarframework/')">
          <q-item-side icon="code" />
          <q-item-main label="툴포프리" sublabel="github.com/tool4free" />
        </q-item>
        <q-item @click.native="openURL('https://github.com/tool4Free/support')">
          <q-item-side icon="record_voice_over" />
          <q-item-main label="문의 및 지원" sublabel="github.com/tool4Free/support" />
        </q-item>
        <q-item @click.native="openURL('https://open.kakao.com/o/geHO1CL')">
        <q-item-side icon="chat" />
        <q-item-main label="카카오톡 오픈채팅방" sublabel="https://discord.gg/x5GUZhA" />
        </q-item>
        <!--<q-item @click.native="openURL('https://discord.gg/x5GUZhA')">-->
          <!--<q-item-side icon="chat" />-->
          <!--<q-item-main label="디스코드 채팅 채널" sublabel="https://discord.gg/x5GUZhA" />-->
        <!--</q-item>-->
        <!--<q-item @click.native="openURL('https://twitter.com/quasarframework')">-->
          <!--<q-item-side icon="rss feed" />-->
          <!--<q-item-main label="Twitter" sublabel="@quasarframework" />-->
        <!--</q-item>-->
      </q-list>
    </q-layout-drawer>

    <q-page-container>
      <router-view />
    </q-page-container>
  </q-layout>
</template>

<script>
import { openURL } from 'quasar'

export default {
  name: 'MyLayout',
  data () {
    return {
      leftDrawerOpen: this.$q.platform.is.desktop
    }
  },
  methods: {
    openURL
  }
}
</script>

<style>
</style>
