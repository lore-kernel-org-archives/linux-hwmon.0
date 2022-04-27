Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39F8EC433F5
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 Apr 2022 14:26:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237863AbiD0O3h (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 27 Apr 2022 10:29:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237809AbiD0O3d (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 27 Apr 2022 10:29:33 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6613B11A3D
        for <linux-hwmon@vger.kernel.org>; Wed, 27 Apr 2022 07:26:21 -0700 (PDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23RCh7FG012093;
        Wed, 27 Apr 2022 14:26:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=VXSUfNGjI2iMNDZeKVwl7bFQMgug83eW3VgecJujP/k=;
 b=kCh30hzm8K05cKliNNXuDfx/N/PN5ZJxxlx3TZGkKUCM8JsbJV8i8DLTvjbC/qRDu0ax
 SzeVGr2V9A+DU2DWH86M/t8+ZnEFM6/m8oKBU2SCBqWVVaxLfYI5anLdgV1CYjuVmyWU
 OXkhC0360wVxcBdNf6BWOb5PEY8wn3fzCOi+JMkKsQzGuVQ+vQFAIWva1/zRSbPMvG2l
 wMt28RIRYaULMmFDeby7JZeEfNuH+qmUzvq93KJacqnWTmT5XH+3BeKhuTydYT5dE2CQ
 Ro12VDvUVob/yKnf43lhdZI7+4dRlCn9kMCNtAWeMmASZMHXrEH/7b141Njwuw7DF48s jg== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fpssq79kt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 27 Apr 2022 14:26:05 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
        by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23RECas6003074;
        Wed, 27 Apr 2022 14:26:04 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
        by ppma02wdc.us.ibm.com with ESMTP id 3fm939vmt9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 27 Apr 2022 14:26:04 +0000
Received: from b03ledav002.gho.boulder.ibm.com (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
        by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 23REQ3uj17826302
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 27 Apr 2022 14:26:03 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 76D0213605D;
        Wed, 27 Apr 2022 14:26:03 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 3F25C136051;
        Wed, 27 Apr 2022 14:26:03 +0000 (GMT)
Received: from [9.211.145.170] (unknown [9.211.145.170])
        by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
        Wed, 27 Apr 2022 14:26:03 +0000 (GMT)
Message-ID: <123fbca0-91e1-4472-8742-98e9cd4dd0cf@linux.ibm.com>
Date:   Wed, 27 Apr 2022 09:26:02 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] hwmon (occ): Avoid polling OCC during probe
Content-Language: en-US
To:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc:     jdelvare@suse.com, joel@jms.id.au
References: <20220426144555.12120-1-eajames@linux.ibm.com>
 <c813b754-591d-3fba-0450-7b73087c1de6@roeck-us.net>
 <b387f7b9-5b87-a2f9-501f-57258b70e387@linux.ibm.com>
 <eef45828-82df-1771-0ef9-454008836154@roeck-us.net>
From:   Eddie James <eajames@linux.ibm.com>
In-Reply-To: <eef45828-82df-1771-0ef9-454008836154@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: vfAkpQHwwM4YYA5LCLWtrvIkMcKUZ5Ab
X-Proofpoint-ORIG-GUID: vfAkpQHwwM4YYA5LCLWtrvIkMcKUZ5Ab
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-27_04,2022-04-27_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 mlxscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 mlxlogscore=999
 malwarescore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2204270090
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


On 4/27/22 08:45, Guenter Roeck wrote:
> On 4/26/22 08:26, Eddie James wrote:
>>
>> On 4/26/22 10:01, Guenter Roeck wrote:
>>> On 4/26/22 07:45, Eddie James wrote:
>>>> Instead of polling the OCC during the probe, use the "occ_active"
>>>> sysfs file to control when the driver polls the OCC for sensor data.
>>>> The reason for this change is that the SBE, which is the device by
>>>> which the driver communicates with the OCC, cannot handle 
>>>> communications
>>>> during certain system state transitions.
>>>>
>>>
>>> This is hackish, to say the least. Why not just instantiate the driver
>>> manually instead if userspace interaction is indeed needed, and there
>>> is no means to auto-instantiate it only after the hardware is ready ?
>>
>>
>> Well, the occ-hwmon platform devices are currently created by the 
>> parent FSI occ device (that's a bit of a hack too). I poked through 
>> the platform/device/bus interfaces but couldn't work out how to 
>> create the device but not probe it, so that userspace could later 
>> bind the device to the driver. The current userspace does just that, 
>> but it relies on the the initial probe failing since SBE can't handle 
>> the communications yet. The error scenario is that the SBE can get 
>> into a bad state, so communications shouldn't even be attempted.
>>
>> So to answer your question, there's no reason not to just instantiate 
>> the driver manually, but I don't actually know how to do so with 
>> these drivers.
>>
>>
>>>
>>> On the other side, what means does userspace have to determine that
>>> the SBE/OCC is ready ? Can't that same mechanism not be used in the
>>> kernel to auto-instantiate the driver ?
>>
>>
>> No it's impossible, it's not just some bit we can check in HW 
>> unfortunately, the signal is PLDM (platform level data model) over 
>> the network.
>>
>
> What a mess.


It is, yes. Just sent a v2. Thanks for taking a second look.


Eddie


>
> The subject and description are misleading. The code doesn't
> "avoid polling during probe", it delays hwmon registration until
> directed to do it by writing into a new sysfs attribute.
> Please update accordingly.


It's actually an existing sysfs file, I've just made it writeable.


>
> Thanks,
> Guenter
