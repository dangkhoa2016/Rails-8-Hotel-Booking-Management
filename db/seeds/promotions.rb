promotions = [
  {
    name: 'Summer Promotion 2025',
    summary: 'Summer promotion for 2025',
    discount_percent: 20,
    discount_type: 0,
    start_date: '2025-06-01',
    end_date: '2025-08-31'
  },
  {
    name: 'Winter Promotion 2025',
    summary: 'Winter promotion for 2025',
    discount_percent: 15,
    discount_type: 0,
    start_date: '2025-12-01',
    end_date: '2026-02-28'
  },
  {
    name: 'Spring Promotion 2025',
    summary: 'Spring promotion for 2025',
    discount_percent: 10,
    discount_type: 0,
    start_date: '2025-03-01',
    end_date: '2025-05-31'
  },
  {
    name: 'Autumn Promotion 2025',
    summary: 'Autumn promotion for 2025',
    discount_percent: 10,
    discount_type: 0,
    start_date: '2025-09-01',
    end_date: '2025-11-30'
  },
  {
    name: 'Christmas Promotion 2025',
    summary: 'Christmas promotion for 2025',
    discount_percent: 25,
    discount_type: 0,
    start_date: '2025-12-24',
    end_date: '2025-12-31'
  },
  {
    name: 'Independence Day Promotion 2025',
    summary: 'Independence Day promotion for 2025',
    discount_amount: 100,
    discount_type: 1,
    start_date: '2025-07-04',
    end_date: '2025-07-04'
  },
  {
    name: 'Valentine\'s Day Promotion 2025',
    summary: 'Valentine\'s Day promotion for 2025',
    discount_amount: 200,
    discount_type: 1,
    start_date: '2025-02-14',
    end_date: '2025-02-14'
  },
  {
    name: 'Black Friday Promotion 2025',
    summary: 'Black Friday promotion for 2025',
    discount_amount: 200,
    discount_type: 1,
    start_date: '2025-11-28',
    end_date: '2025-11-28'
  },
  {
    name: 'Cyber Monday Promotion 2025',
    summary: 'Cyber Monday promotion for 2025',
    discount_amount: 250,
    discount_type: 1,
    start_date: '2025-12-01',
    end_date: '2025-12-01'
  },
  {
    name: 'Halloween Promotion 2025',
    summary: 'Halloween promotion for 2025',
    discount_amount: 150,
    discount_type: 1,
    start_date: '2025-10-31',
    end_date: '2025-10-31'
  },
  {
    name: 'Easter Promotion 2025',
    summary: 'Easter promotion for 2025',
    discount_amount: 400,
    discount_type: 1,
    start_date: '2025-04-12',
    end_date: '2025-04-12'
  },
  {
    name: 'Mother\'s Day Promotion 2025',
    summary: 'Mother\'s Day promotion for 2025',
    discount_amount: 100,
    discount_type: 1,
    start_date: '2025-05-11',
    end_date: '2025-05-15'
  }
]

promotions.each do |promotion|
  Promotion.find_or_create_by!(promotion)
end
