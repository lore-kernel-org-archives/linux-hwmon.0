Return-Path: <SRS0=assb=24=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE086C33C9E
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Jan 2020 13:33:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B410B2146E
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Jan 2020 13:33:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DS7ikEDs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727658AbgAGNdB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 7 Jan 2020 08:33:01 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:34556 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727944AbgAGNdB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 7 Jan 2020 08:33:01 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 007DTTU2111084;
        Tue, 7 Jan 2020 13:32:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=no+V2rSjh3AierNQkc5xh/z+BptwOtKrn3uofiFT/9A=;
 b=DS7ikEDs8rMb3JUT/e7UBEV9FFFvyQTc2M5BE27qIGDRIvXmxGbHiMGDKwLr/5iNN/WT
 deBVfyvYTmdPGIJQR02NhXrFOmDUplwWmPTLtMv2g3tz1eluNgzrzFYXxTeuVJSTEzdL
 1av6hQio/hLndPzzGm0pj2YGznl68LpKHU5pFjCtuMHys82X1vpCYPHl+xh7Un9ic30T
 xh2qfaknUjtQE8LL3gglyR+zbVOd74xfLSvgangA0SLIyVAc9/UsWT9dHr+mdXfM7rut
 gDi8d/D9PLfqFko7Zjcg4GRz0taicGoERGlxmKZcje0O78NOEX0lTtzL7vHT4hqRG/BS ew== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 2xajnpwf6b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 07 Jan 2020 13:32:47 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 007DSYnr177423;
        Tue, 7 Jan 2020 13:32:46 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3030.oracle.com with ESMTP id 2xcjvd5xa1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 07 Jan 2020 13:32:46 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 007DWjD8030883;
        Tue, 7 Jan 2020 13:32:45 GMT
Received: from kili.mountain (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 07 Jan 2020 05:32:44 -0800
Date:   Tue, 7 Jan 2020 16:32:35 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     eajames@linux.ibm.com
Cc:     linux-hwmon@vger.kernel.org
Subject: [bug report] hwmon: (pmbus/ibm-cffps) Add new manufacturer debugfs
 entries
Message-ID: <20200107133235.ug54ssy5bqpg3qp3@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9492 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=833
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001070113
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9492 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=894 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001070113
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hello Eddie James,

The patch bb3c0a27ed1d: "hwmon: (pmbus/ibm-cffps) Add new
manufacturer debugfs entries" from Dec 19, 2019, leads to the
following static checker warning:

	drivers/hwmon/pmbus/ibm-cffps.c:257 ibm_cffps_debugfs_write()
	error: uninitialized symbol 'data'.

drivers/hwmon/pmbus/ibm-cffps.c
   238  static ssize_t ibm_cffps_debugfs_write(struct file *file,
   239                                         const char __user *buf, size_t count,
   240                                         loff_t *ppos)
   241  {
   242          u8 data;
   243          ssize_t rc;
   244          int *idxp = file->private_data;
   245          int idx = *idxp;
   246          struct ibm_cffps *psu = to_psu(idxp, idx);
   247  
   248          switch (idx) {
   249          case CFFPS_DEBUGFS_ON_OFF_CONFIG:
   250                  pmbus_set_page(psu->client, 0);
   251  
   252                  rc = simple_write_to_buffer(&data, 1, ppos, buf, count);
                                                    ^^^^^^^^^^^^^^
If "ppos >= 1" then "data" isn't initialized but "rc" is zero.

   253                  if (rc < 0)
   254                          return rc;
   255  
   256                  rc = i2c_smbus_write_byte_data(psu->client,
   257                                                 PMBUS_ON_OFF_CONFIG, data);
   258                  if (rc)
   259                          return rc;
   260  
   261                  rc = 1;
   262                  break;
   263          default:
   264                  return -EINVAL;
   265          }
   266  
   267          return rc;
   268  }

regards,
dan carpenter
