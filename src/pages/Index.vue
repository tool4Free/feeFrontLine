<template>
  <q-page padding>
    <p class="caption text-right"> </p>
    <q-table
      :data="tableData"
      :columns="columns"
      :filter="filter"
      :visible-columns="visibleColumns"
      :separator="separator"
      :pagination.sync="pagination"
      :pagination-label=paginationLabel
      row-key="list"
      color="secondary"
      rows-per-page-label="페이지 당 보여줄 개수"
    >
      <template slot="top-left" slot-scope="props">
        <q-search
          placeholder="원청검색"
          hide-underline
          color="secondary"
          v-model="filter"
          class="col-6"
        />
      </template>
      <template slot="top-right" slot-scope="props">
        <q-table-columns
          label="열선택"
          color="secondary"
          class="q-mr-sm"
          v-model="visibleColumns"
          :columns="columns"
        />
        <q-select
          placeholder="스타일"
          color="secondary"
          v-model="separator"
          :options="[
            { label: '수평선', value: 'horizontal' },
            { label: '수직선', value: 'vertical' },
            { label: '셀', value: 'cell' },
            { label: '없음', value: 'none' }
          ]"
          hide-underline
        />
        <q-btn
          flat round dense
          :icon="props.inFullscreen ? 'fullscreen_exit' : 'fullscreen'"
          @click="props.toggleFullscreen"
        />
      </template>
      <!-- 언어 슬롯 slot name syntax: body-cell-<column_name> -->
      <q-td slot="body-cell-languages" slot-scope="props" :props="props">
        <q-chip v-for="(language, index) in props.value" :key="`language-${index}`" small color="secondary">{{ language }}</q-chip>
      </q-td>
      <!-- 프레임워크 슬롯 slot name syntax: body-cell-<column_name> -->
      <q-td slot="body-cell-frameworks" slot-scope="props" :props="props">
        <q-chip v-for="(framework, index) in props.value" :key="`framework-${index}`" small color="secondary">{{ framework }}</q-chip>
      </q-td>
    </q-table>
  </q-page>
</template>

<script>
import tableData from 'assets/table-data'

export default {
  data: () => ({
    tableData,
    columns: [
      {
        name: 'mainContract',
        label: '원청',
        field: 'mainContract',
        sortable: true,
        align: 'left',
        classes: 'my-class'
      },
      {name: 'depth', label: '단계', field: 'depth', sortable: true},
      {name: 'subContracting', label: '하청', field: 'subContracting', sortable: true},
      {name: 'year', label: '연도', field: 'year', sortable: true},
      {name: 'period', label: '기간(월)', field: 'period', sortable: true},
      {name: 'languages', label: '언어', field: 'languages', sortable: true},
      {name: 'frameworks', label: '프레임웤', field: 'frameworks', sortable: true},
      {name: 'type', label: '종류', field: 'type', sortable: true},
      {name: 'career', label: '경력', field: 'career', sortable: true, sort: (a, b) => parseInt(a, 10) - parseInt(b, 10)},
      {name: 'amount', label: '단가', field: 'amount', sort: (a, b) => parseInt(a, 10) - parseInt(b, 10)},
      {name: 'localExpenses', label: '체제비', field: 'localExpenses'}
    ],
    pagination: {
      sortBy: 'mainContract', // String, column "name" property value
      descending: false,
      page: 1,
      rowsPerPage: 7 // current rows per page being displayed
    },
    filter: '',
    visibleColumns: ['mainContract', 'depth', 'year', 'languages', 'type', 'career', 'amount', 'localExpenses'],
    separator: 'horizontal'
  }),
  methods: {
    paginationLabel (start, end, total) {
      return `${start} 에서 ${end} 까지(총 ${total}) `
    }
  }
}
</script>
