Return-Path: <SRS0=FEvN=SL=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77335C10F0E
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Apr 2019 21:16:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 46A1E20833
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Apr 2019 21:16:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726487AbfDIVQA (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 9 Apr 2019 17:16:00 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:49208 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726444AbfDIVP7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 9 Apr 2019 17:15:59 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x39LE6nC180040
        for <linux-hwmon@vger.kernel.org>; Tue, 9 Apr 2019 17:15:58 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2rs2hm1fp1-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Tue, 09 Apr 2019 17:15:58 -0400
Received: from localhost
        by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-hwmon@vger.kernel.org> from <eajames@linux.vnet.ibm.com>;
        Tue, 9 Apr 2019 22:15:57 +0100
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
        by e11.ny.us.ibm.com (146.89.104.198) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Tue, 9 Apr 2019 22:15:55 +0100
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com [9.57.199.107])
        by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x39LFs7w10420346
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 9 Apr 2019 21:15:54 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 11F65124053;
        Tue,  9 Apr 2019 21:15:54 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id A7EA9124055;
        Tue,  9 Apr 2019 21:15:53 +0000 (GMT)
Received: from [9.41.179.222] (unknown [9.41.179.222])
        by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
        Tue,  9 Apr 2019 21:15:53 +0000 (GMT)
Subject: Re: [PATCH] hwmon: OCC drivers are PowerPC-only
To:     Jean Delvare <jdelvare@suse.de>
Cc:     linux-hwmon@vger.kernel.org, Eddie James <eajames@linux.ibm.com>,
        Guenter Roeck <linux@roeck-us.net>
References: <20190409144509.19da00c4@endymion>
 <a07ecf9c-2ad2-70f6-0f2f-1c438be3acdc@linux.vnet.ibm.com>
 <20190409214433.2b96cd8c@endymion>
From:   Eddie James <eajames@linux.vnet.ibm.com>
Date:   Tue, 9 Apr 2019 16:15:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <20190409214433.2b96cd8c@endymion>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19040921-2213-0000-0000-000003741181
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010897; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000284; SDB=6.01186752; UDB=6.00621573; IPR=6.00967512;
 MB=3.00026368; MTD=3.00000008; XFM=3.00000015; UTC=2019-04-09 21:15:56
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19040921-2214-0000-0000-00005DF6B652
Message-Id: <de073ff0-846f-891f-4f82-1fdfb2a5d745@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-04-09_11:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=800 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904090133
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


On 4/9/19 2:44 PM, Jean Delvare wrote:
> Hi Eddie,
>
> Thanks for the quick answer.
>
> On Tue, 9 Apr 2019 10:20:22 -0500, Eddie James wrote:
>> On 4/9/19 7:45 AM, Jean Delvare wrote:
>>> Don't propose PowerPC-only drivers on other architectures, unless
>>> build-testing.
>> This driver does NOT only run on PowerPC; rather it runs on a BMC
>> processor connected to a PowerPC processor. BMC will most likely be ARM,
> Thanks for clarifying. So, you have a server with one or more PowerPC
> processors, running any operating system decided by the customer, and
> in the same system, is a BMC, running a Linux operating system provided
> by IBM? Do I understand it correctly?


Exactly, though the operating system running on the BMC (OpenBMC) is 
used/developed by a number of other companies as well.


>
>> but shouldn't be restricted to that arch only.
> Why not? Restricting drivers to the architectures or platforms where
> they make sense significantly eases the work of the maintainers of
> distribution kernels. Each new kernel version comes with several dozens
> of new options. Without hints, they have no idea what is needed on
> which architecture, and they either select everything, resulting in an
> overweight kernel forever, or nothing, resulting in missing features
> until someone complains.


I see, that makes sense to restrict it then. It is possible someone will 
want to run OpenBMC managing a Power processor on something other than 
an ARM chip, but I don't think that configuration is needed right now.


>
> Regardless of any dependency at the Kconfig level, the help text of
> these drivers should explain exactly what you wrote above. At the
> moment, the reader has no way to guess that the drivers only make sense
> for an embedded Linux running on a BMC. As I understand it now, general
> purpose distributions do not need these drivers, right? But for example
> SUSE kernels included them on all architectures. I just restricted them
> to ppc64, but apparently I was wrong and it should be disabled there
> too.
>
> A good Kconfig help text should help the user decide whether they need
> the driver or not.


Yep, the Kconfig text can probably be improved as well. I'll look into that.


>
>>> Also drop configuration symbol SENSORS_OCC which serves no purpose
>>> that I can see.
>>>
>>> Signed-off-by: Jean Delvare <jdelvare@suse.de>
>>> Cc: Eddie James <eajames@linux.ibm.com>
>>> Cc: Guenter Roeck <linux@roeck-us.net>
>>> ---
>>> SENSORS_OCC *would* serve a purpose if the common code between the
>>> POWER8 driver and the POWER9 driver would go in a separate, shared
>>> module, and occ-p8-hwmon and occ-p9-hwmon would only contain the
>>> specific code. This would avoid packaging the same code twice in 2
>>> separate modules, therefore saving some storage space for ppc
>>> distributions.
>> Well you'd never have both P8 and P9 enabled at once, so space shouldn't
>> be an issue. I agree this could be cleaner but I think I was getting
> Where "you" is IBM, provider of the embedded Linux running on the BMC?


Yes, though again could be any distributor of OpenBMC.

Thanks for looking into this!

Eddie


>
>> duplicate symbol errors for the compile test and so I did it this way.
>> If this doesn't lead to errors in the compile test, I'm fine with this
>> (without the change for PPC only though).
> Dropping SENSORS_OCC can't result in duplicate symbols because it is a
> no-op. But while this is the easiest solution, it it not the cleanest
> in my opinion. OTOH, if you are certain that both modules will never be
> shipped at the same time, then it indeed doesn't matter that much. I
> can provide a patch going in either direction. Guenter, any preference?
>

