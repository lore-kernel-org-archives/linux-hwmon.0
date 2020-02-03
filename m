Return-Path: <SRS0=RmMb=3X=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 089B8C3524D
	for <linux-hwmon@archiver.kernel.org>; Mon,  3 Feb 2020 08:45:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C55B720661
	for <linux-hwmon@archiver.kernel.org>; Mon,  3 Feb 2020 08:45:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZvzboCB2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727351AbgBCIpu (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 3 Feb 2020 03:45:50 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:48960 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726410AbgBCIpu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 3 Feb 2020 03:45:50 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 0138i4FR080648;
        Mon, 3 Feb 2020 08:45:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=fIhpZirZgu6aMl7Kj1J3qlPjpRzEKdEd+Vb72LMfALQ=;
 b=ZvzboCB2Q7087B/bzg+idr/unHVFtbVOjCUKsHPqxEj2DO+R6gVRlFfZAZyZaal/smbm
 K0Wa0E1pNQPVkWY4KtZdG99TRHfBxC4Xk29s0fQzfqSJb7TUBCAQsmZhee0Zr4KflFyr
 H2Ce60l2gj65tZrdMJgDRN1eb65hUsZEKeLse7jmcGGVhDygwdCN5CJkznsf6Glwqx6v
 /dU9ALw1BfNjbiX7mXpje9/+YYTcSKBhPuspPSe8hmOWzrm12hwrYAZYXePV+OF5ZJIS
 547tGWH66TLzBi5z3MfX7AU8mQXnldPId9k2KU0FKAuo7eZM33Omwp3UP3ioRw002QNK WA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2120.oracle.com with ESMTP id 2xwyg9ad8u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 03 Feb 2020 08:45:30 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 0138iE3k123754;
        Mon, 3 Feb 2020 08:45:29 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3030.oracle.com with ESMTP id 2xwjt3c7hu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 03 Feb 2020 08:45:29 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0138jSr5006893;
        Mon, 3 Feb 2020 08:45:28 GMT
Received: from kadam (/41.210.143.134)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 03 Feb 2020 00:45:28 -0800
Date:   Mon, 3 Feb 2020 11:45:22 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     kbuild@lists.01.org, Guenter Roeck <linux@roeck-us.net>
Cc:     kbuild-all@lists.01.org, linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-playground 6/16] drivers/hwmon/pmbus/pmbus_core.c:174
 pmbus_set_page() warn: this array is probably non-NULL. 'data->info->phases'
Message-ID: <20200203084521.GI11068@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9519 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2002030070
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9519 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2002030070
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-playground
head:   b6b911a2f7d675c768f19e75ba2e8ed216fce65a
commit: 17e064db5aa2cfbfd254c0951544f88b2b1258ee [6/16] hwmon: (pmbus) Implement multi-phase support

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/hwmon/pmbus/pmbus_core.c:174 pmbus_set_page() warn: this array is non-NULL. 'data->info->phases'

# https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/commit/?id=17e064db5aa2cfbfd254c0951544f88b2b1258ee
git remote add hwmon https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
git remote update hwmon
git checkout 17e064db5aa2cfbfd254c0951544f88b2b1258ee
vim +174 drivers/hwmon/pmbus/pmbus_core.c

ce603b18f30aea drivers/hwmon/pmbus/pmbus_core.c Guenter Roeck  2013-01-26  150  
6db8d5dba444f2 drivers/hwmon/pmbus/pmbus_core.c Guenter Roeck  2020-01-14  151  int pmbus_set_page(struct i2c_client *client, int page, int phase)
442aba78728e77 drivers/hwmon/pmbus_core.c       Guenter Roeck  2011-01-26  152  {
442aba78728e77 drivers/hwmon/pmbus_core.c       Guenter Roeck  2011-01-26  153  	struct pmbus_data *data = i2c_get_clientdata(client);
464df6fa376678 drivers/hwmon/pmbus/pmbus_core.c Andrew Jeffery 2017-11-20  154  	int rv;
464df6fa376678 drivers/hwmon/pmbus/pmbus_core.c Andrew Jeffery 2017-11-20  155  
17e064db5aa2cf drivers/hwmon/pmbus/pmbus_core.c Guenter Roeck  2020-01-13  156  	if (page < 0)
464df6fa376678 drivers/hwmon/pmbus/pmbus_core.c Andrew Jeffery 2017-11-20  157  		return 0;
442aba78728e77 drivers/hwmon/pmbus_core.c       Guenter Roeck  2011-01-26  158  
17e064db5aa2cf drivers/hwmon/pmbus/pmbus_core.c Guenter Roeck  2020-01-13  159  	if (!(data->info->func[page] & PMBUS_PAGE_VIRTUAL) &&
17e064db5aa2cf drivers/hwmon/pmbus/pmbus_core.c Guenter Roeck  2020-01-13  160  	    data->info->pages > 1 && page != data->currpage) {
442aba78728e77 drivers/hwmon/pmbus_core.c       Guenter Roeck  2011-01-26  161  		rv = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
464df6fa376678 drivers/hwmon/pmbus/pmbus_core.c Andrew Jeffery 2017-11-20  162  		if (rv < 0)
442aba78728e77 drivers/hwmon/pmbus_core.c       Guenter Roeck  2011-01-26  163  			return rv;
464df6fa376678 drivers/hwmon/pmbus/pmbus_core.c Andrew Jeffery 2017-11-20  164  
464df6fa376678 drivers/hwmon/pmbus/pmbus_core.c Andrew Jeffery 2017-11-20  165  		rv = i2c_smbus_read_byte_data(client, PMBUS_PAGE);
464df6fa376678 drivers/hwmon/pmbus/pmbus_core.c Andrew Jeffery 2017-11-20  166  		if (rv < 0)
464df6fa376678 drivers/hwmon/pmbus/pmbus_core.c Andrew Jeffery 2017-11-20  167  			return rv;
464df6fa376678 drivers/hwmon/pmbus/pmbus_core.c Andrew Jeffery 2017-11-20  168  
464df6fa376678 drivers/hwmon/pmbus/pmbus_core.c Andrew Jeffery 2017-11-20  169  		if (rv != page)
464df6fa376678 drivers/hwmon/pmbus/pmbus_core.c Andrew Jeffery 2017-11-20  170  			return -EIO;
464df6fa376678 drivers/hwmon/pmbus/pmbus_core.c Andrew Jeffery 2017-11-20  171  	}
464df6fa376678 drivers/hwmon/pmbus/pmbus_core.c Andrew Jeffery 2017-11-20  172  	data->currpage = page;
464df6fa376678 drivers/hwmon/pmbus/pmbus_core.c Andrew Jeffery 2017-11-20  173  
17e064db5aa2cf drivers/hwmon/pmbus/pmbus_core.c Guenter Roeck  2020-01-13 @174  	if (data->info->phases && data->currphase != phase &&
                                                                                            ^^^^^^^^^^^^^^^^^^
Delete this condition?

17e064db5aa2cf drivers/hwmon/pmbus/pmbus_core.c Guenter Roeck  2020-01-13  175  	    !(data->info->func[page] & PMBUS_PHASE_VIRTUAL)) {
17e064db5aa2cf drivers/hwmon/pmbus/pmbus_core.c Guenter Roeck  2020-01-13  176  		rv = i2c_smbus_write_byte_data(client, PMBUS_PHASE,
17e064db5aa2cf drivers/hwmon/pmbus/pmbus_core.c Guenter Roeck  2020-01-13  177  					       phase);
17e064db5aa2cf drivers/hwmon/pmbus/pmbus_core.c Guenter Roeck  2020-01-13  178  		if (rv)
17e064db5aa2cf drivers/hwmon/pmbus/pmbus_core.c Guenter Roeck  2020-01-13  179  			return rv;
17e064db5aa2cf drivers/hwmon/pmbus/pmbus_core.c Guenter Roeck  2020-01-13  180  	}
17e064db5aa2cf drivers/hwmon/pmbus/pmbus_core.c Guenter Roeck  2020-01-13  181  	data->currphase = phase;
17e064db5aa2cf drivers/hwmon/pmbus/pmbus_core.c Guenter Roeck  2020-01-13  182  
464df6fa376678 drivers/hwmon/pmbus/pmbus_core.c Andrew Jeffery 2017-11-20  183  	return 0;
442aba78728e77 drivers/hwmon/pmbus_core.c       Guenter Roeck  2011-01-26  184  }
442aba78728e77 drivers/hwmon/pmbus_core.c       Guenter Roeck  2011-01-26  185  EXPORT_SYMBOL_GPL(pmbus_set_page);
442aba78728e77 drivers/hwmon/pmbus_core.c       Guenter Roeck  2011-01-26  186  

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation
