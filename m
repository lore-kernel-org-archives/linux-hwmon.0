Return-Path: <SRS0=assb=24=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BB19C33C8C
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Jan 2020 15:09:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 68D312087F
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Jan 2020 15:09:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728048AbgAGPJC (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 7 Jan 2020 10:09:02 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:14680 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727880AbgAGPJB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 7 Jan 2020 10:09:01 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 007F52Uu092016;
        Tue, 7 Jan 2020 10:08:40 -0500
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2xcu56juvh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 07 Jan 2020 10:08:40 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
        by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 007F5esM027977;
        Tue, 7 Jan 2020 15:08:39 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
        by ppma01dal.us.ibm.com with ESMTP id 2xajb6k3hv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 07 Jan 2020 15:08:39 +0000
Received: from b03ledav001.gho.boulder.ibm.com (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
        by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 007F8bH956033786
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 7 Jan 2020 15:08:37 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 9CE4D6E05D;
        Tue,  7 Jan 2020 15:08:37 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 6DB046E056;
        Tue,  7 Jan 2020 15:08:37 +0000 (GMT)
Received: from [9.163.26.112] (unknown [9.163.26.112])
        by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
        Tue,  7 Jan 2020 15:08:37 +0000 (GMT)
Subject: Re: [bug report] hwmon: (pmbus/ibm-cffps) Add new manufacturer
 debugfs entries
To:     Guenter Roeck <linux@roeck-us.net>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-hwmon@vger.kernel.org
References: <20200107133235.ug54ssy5bqpg3qp3@kili.mountain>
 <a9d596c2-bbbf-02e0-80a0-50cecf6a0665@roeck-us.net>
From:   Eddie James <eajames@linux.ibm.com>
Message-ID: <4fd3f6eb-e3b1-352f-40cd-668e334eb79f@linux.ibm.com>
Date:   Tue, 7 Jan 2020 09:08:36 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <a9d596c2-bbbf-02e0-80a0-50cecf6a0665@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-01-07_05:2020-01-07,2020-01-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1011
 bulkscore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=999
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001070124
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


On 1/7/20 7:53 AM, Guenter Roeck wrote:
> On 1/7/20 5:32 AM, Dan Carpenter wrote:
>> Hello Eddie James,
>>
>> The patch bb3c0a27ed1d: "hwmon: (pmbus/ibm-cffps) Add new
>> manufacturer debugfs entries" from Dec 19, 2019, leads to the
>> following static checker warning:
>>
>>     drivers/hwmon/pmbus/ibm-cffps.c:257 ibm_cffps_debugfs_write()
>>     error: uninitialized symbol 'data'.
>>
>> drivers/hwmon/pmbus/ibm-cffps.c
>>     238  static ssize_t ibm_cffps_debugfs_write(struct file *file,
>>     239                                         const char __user 
>> *buf, size_t count,
>>     240                                         loff_t *ppos)
>>     241  {
>>     242          u8 data;
>>     243          ssize_t rc;
>>     244          int *idxp = file->private_data;
>>     245          int idx = *idxp;
>>     246          struct ibm_cffps *psu = to_psu(idxp, idx);
>>     247
>>     248          switch (idx) {
>>     249          case CFFPS_DEBUGFS_ON_OFF_CONFIG:
>>     250                  pmbus_set_page(psu->client, 0);
>>     251
>>     252                  rc = simple_write_to_buffer(&data, 1, ppos, 
>> buf, count);
>> ^^^^^^^^^^^^^^
>> If "ppos >= 1" then "data" isn't initialized but "rc" is zero.
>>
>
> If rc == 0 (ie if no data was read) we should probably bail out here 
> (either return
> an error or 0).


I'll make the change.


Good catch Dan, thanks!

Eddie


>
> Guenter
>
>>     253                  if (rc < 0)
>>     254                          return rc;
>>     255
>>     256                  rc = i2c_smbus_write_byte_data(psu->client,
>>     257 PMBUS_ON_OFF_CONFIG, data);
>>     258                  if (rc)
>>     259                          return rc;
>>     260
>>     261                  rc = 1;
>>     262                  break;
>>     263          default:
>>     264                  return -EINVAL;
>>     265          }
>>     266
>>     267          return rc;
>>     268  }
>>
>> regards,
>> dan carpenter
>>
>
