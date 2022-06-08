Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95057C433EF
	for <linux-hwmon@archiver.kernel.org>; Wed,  8 Jun 2022 04:55:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229866AbiFHEzQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 8 Jun 2022 00:55:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233274AbiFHEyF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 8 Jun 2022 00:54:05 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CF0726A0AB
        for <linux-hwmon@vger.kernel.org>; Tue,  7 Jun 2022 18:26:32 -0700 (PDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2580etvq029390;
        Wed, 8 Jun 2022 01:26:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=BLSYBtd2JCoc94fafJOkMI05DxeX3/egbqcGkjxDcOk=;
 b=iX6y9E5yZn3qRzxD/mc0xplVa1Ekss14yrJSHTOflRZWtO/bTw+AOOLZ7KszytUOXRAE
 OpZzSrmBTo4BwRCJffBHFh0EBdHcbR4wvtT12jW9gKvruoowHxhYBL5pcl8EYxd+yafU
 4WNMSMeslZmazLSQgLaCGuwrs5d6bNbKdwbNFk+gQRnNiFDd9gmdQZ5sraLQzn0B+ggA
 karo0FBkdg9arAM3Xlvud0Zla746eFj+cgtpjaqe+/amY1VmAfgpPemKjf8EP2G/+A1V
 9xm3jfBExEOAFyjASzhQggg29RxthK11ar86tgTCM1Q7B0VwPoAMaJITR+9j7vcguBL0 HA== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gjhebrm6x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 08 Jun 2022 01:26:14 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
        by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2581L49x025796;
        Wed, 8 Jun 2022 01:26:13 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com [9.57.198.25])
        by ppma03dal.us.ibm.com with ESMTP id 3gfy1awvys-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 08 Jun 2022 01:26:13 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com [9.57.199.109])
        by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2581QDGF39584050
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 8 Jun 2022 01:26:13 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id E8846112064;
        Wed,  8 Jun 2022 01:26:12 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 4D427112063;
        Wed,  8 Jun 2022 01:26:12 +0000 (GMT)
Received: from [9.211.120.23] (unknown [9.211.120.23])
        by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
        Wed,  8 Jun 2022 01:26:12 +0000 (GMT)
Message-ID: <d50e6018-7b1b-6369-1ed2-1548841f7524@linux.ibm.com>
Date:   Tue, 7 Jun 2022 20:26:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] hwmon: (ucd9000) Add voltage monitor types
Content-Language: en-US
To:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
        joel@jms.id.au, openbmc@lists.ozlabs.org
References: <20220607205306.145636-1-wrightj@linux.ibm.com>
 <cf1a2ff9-59b3-fb2d-62fd-bdeac57bb9c0@roeck-us.net>
From:   Jim Wright <wrightj@linux.ibm.com>
In-Reply-To: <cf1a2ff9-59b3-fb2d-62fd-bdeac57bb9c0@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ZJt0eOvmSr-lLUD_4LS6qfE6FZLsrrOD
X-Proofpoint-ORIG-GUID: ZJt0eOvmSr-lLUD_4LS6qfE6FZLsrrOD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-07_11,2022-06-07_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 mlxlogscore=986 suspectscore=0
 mlxscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206080003
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 6/7/2022 8:13 PM, Guenter Roeck wrote:
> 
> I don't think it makes sense to claim VOUT support if the chip is
> configured to monitor input voltages. This should probably be something
> like
> 
> ...
>  > +        case UCD9000_MON_VOLTAGE_AVS:
>  >               info->func[page] |= PMBUS_HAVE_VOUT
>  >                 | PMBUS_HAVE_STATUS_VOUT;
>  >               break;
>          case UCD9000_MON_INPUT_VOLTAGE:
>          case UCD9000_MON_INPUT_VOLTAGE_AVS:
>              info->func[page] |= PMBUS_HAVE_VIN;
>               break;
> 
> with appropriate mapping code to map the READ_VIN command for the
> affected pages to READ_VOUT. Question is if the limit registers on
> those pages are also reporting the limits using the vout limit
> commands; if so, those should be mapped as well.
> 
> Guenter

Hi Guenter,

Thank you for the review. I'll drop adding the input voltage types and 
resend the patch.

Jim Wright
