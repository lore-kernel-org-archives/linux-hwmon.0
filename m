Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803B1402BB1
	for <linux-hwmon@vger.kernel.org>; Wed,  8 Jul 2026 08:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783499940; cv=none; b=uh4mtYEVHpBzKrknzY/CA9FLH63LueWiuVq5V2CqgWPOQkiKEY3QyYYsLzedvQuhvLW5fXzAOrTuZ9c5Xy4JdVxZwvKBGYTUZjK4zgn9mf5aRHc4Qem5lrrlA6MiQr1f0B1mh0djCYQyqlZYGN5+N8M34t5MO2wPwg4/hiwcJ68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783499940; c=relaxed/simple;
	bh=bgB4zWzbm5nPnDgRkckzv5MlzAsLHswlLS4WHPbWaB8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=joHUbk17zBI3o/4zOlHNMBPAwG7RG7Fmy0sKnaVjVUtADgW8KCCukDU0Lz49sZpbrLeaI2vhF9qjjcdbYBYqbXrEw2lGlhCehnGHBwlpWOPrAenykG8ed/ErrLlfhIElddEOldm6ks3gWCXgM6q5VdCdqmFP1s/npH+NuPtkELQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DerzV+u2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OpaLE8KK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DerzV+u2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OpaLE8KK"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66889EVT2007705
	for <linux-hwmon@vger.kernel.org>; Wed, 8 Jul 2026 08:38:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GZt4yKJAJwIgvmsdUsVQCiNImI+HU9ORBaWda9zrk+o=; b=DerzV+u2wiT66Lh3
	OsswmCwM5fUK3oTANpYnlSvRZl2YitbN8Q/LveY4SFP39eRkc7uQX6DG/19qYZlI
	gXym09chIOTAAsDTMQ2dk//HTanp0rcAFm/5l1vQETmsttx03RLKHoKhmvWa4Nf3
	+L1DOj0DbBJ7mIZwVcjl4gGM9i9hx1oKW30gNa1w+42e6DB4boppobf+JULRRKh5
	9fdaHLtM+H+DjpFQoavXDkY4EryyakPVe7AdwpYleYyR9dahKNQSaoTPjim0sc2W
	CsM4Ld0XZ4d+FgHrjc0JXe9GV72FJB+jibLysEt7nuNYX+ZOoEV0wabJZ/qxiZ6J
	eX8JFQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f97u12j70-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Wed, 08 Jul 2026 08:38:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1d137a68so9836931cf.3
        for <linux-hwmon@vger.kernel.org>; Wed, 08 Jul 2026 01:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783499933; x=1784104733; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GZt4yKJAJwIgvmsdUsVQCiNImI+HU9ORBaWda9zrk+o=;
        b=OpaLE8KKdqV1L1TRgDYPoJOumjUHR82AAEc5VljF5XpTa5riC39x390CYZh0doHMzh
         iXwbFAmV5YJmmnuEbExvkcaS+SAEWhFuP23UiAwv+Kkzf8Nn90/2G9cjZWjWj++d87ay
         nWalCNKD2TRM2LeJ1psLMpWITUIM6x/gOnZ6Ue0ybQ8CVfzijXxvf3YDSUpHnyDR/GvL
         dYuy9OjE/dGXvYvQiX+ysfWGSMwbN6KwdcCpjTQzQYVOk5UHx/2Z5rDANIwkA9sSSuQQ
         EY5WrpSISddJlYdHlQz7K8UXw7TfJ/YGr2ep7k7YyvsYNefXFT0eBxuIB8p/OGCQfF/a
         x2Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783499933; x=1784104733;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GZt4yKJAJwIgvmsdUsVQCiNImI+HU9ORBaWda9zrk+o=;
        b=D84HNuI7UaqVCFNEAE9QFlq+LJLs0WuVCjN3bCneJR+HDrWGl0aVO8nH3tPsMQhGFw
         8u062RXtsgfjgiladMgcGHakbG9PitXwdjvTVdmUVbuvu65mCZKOCae7CwEJtKmP6OGf
         SynQ0TYmMo6bdCoPU92V7gVcJgYmQf9cLP6QY5cgAABoI6eq982ZHdxHG5kQkIvvEvP8
         htpKdPyjc+RutSgAMylBKLOeV4uEjKC/0e18/HNfcX87pfHUFuRJVXl9FwZCMpVCAmXc
         PVLP2BN6SnjpMED5+5T5N+6gpbOgEDaLTVOMQVb82WvE3g5/IFfwmS6Lqb1xUM1peorZ
         RjBg==
X-Forwarded-Encrypted: i=1; AHgh+RrZda752N/JBOP1AqfCLx81ahEEQYsvJLtfLpmNAZSfJ5pnoOEqgyF4sesvjAFfWLVXk5MSYZ43n+FYXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDJDY1ufZv5VmEBl1HQkeOdYpdnJo0FeeFI7xmWm9dNMocoOGU
	O7j3uMgepHsfrCAbf8Z3t0pgvwrKYTfzYg7SHo062sjOXKHl3LBuCvU08wbSd4iu98uCOPvh25j
	k9UTig7eqo/wahA4bxK+LJIYzZQKGwWUpzr1CD5Acdj7tvAdt4Y+4TlTSHPATeqj9dA==
X-Gm-Gg: AfdE7cnzIj/3tPyIWPfDzj7isNg1M9ktmi/W3PIu3Ay59uodhWEFaz7Bu+wsyKf/Vgf
	Bo1Dr8XEU1OPvrZSFSyIrh3SssNcQmpOEXgQ35utUKuuIyh+nkZGJuEflNzZ4x8o025hcnsY71W
	dTrvHxcICWD6VjMyIEBRvwnGPkbFu+eLXNXYD5/5BMCqz1G9h1B3mH0WeYfA6mXsl/0IGImdEOT
	QzgcFFoHba/+1SOvortJZBCRnDXEBkAKEPoR7FOxKbxUpF7Eg3yfFjHQ5VCseF8AWqyttLdUV+l
	7cqh6Mrkj7nmZzbN1KIhoaC5btWaU3scxBqA2tUqF25WedSoFZT5pymM8kdMOPd4DQqWuOGXKPY
	HPCsHej8QHhQhyrPuSASEd3wMtr+Qn1vyygGktJV/ZszW
X-Received: by 2002:ac8:5d92:0:b0:517:875a:d634 with SMTP id d75a77b69052e-51c8b39fac2mr16427721cf.2.1783499933119;
        Wed, 08 Jul 2026 01:38:53 -0700 (PDT)
X-Received: by 2002:ac8:5d92:0:b0:517:875a:d634 with SMTP id d75a77b69052e-51c8b39fac2mr16427361cf.2.1783499932643;
        Wed, 08 Jul 2026 01:38:52 -0700 (PDT)
Received: from [10.111.138.111] ([212.136.9.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15adb482f7sm278181466b.59.2026.07.08.01.38.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 01:38:51 -0700 (PDT)
Message-ID: <ac9c6ace-31f1-4bd5-9d81-ec850179e85b@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 10:38:49 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] platform: arm64: lenovo-thinkpad-t14s-ec: Add
 hwmon support for temperatures
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        neil.armstrong@linaro.org, gaurav.kohli@oss.qualcomm.com,
        manaf.pallikunhi@oss.qualcomm.com, priyansh.jain@oss.qualcomm.com
References: <20260707192228.14647-1-daniel.lezcano@oss.qualcomm.com>
 <20260707192228.14647-3-daniel.lezcano@oss.qualcomm.com>
 <20260708-wakeful-cyan-caribou-35fd09@quoll>
 <bba69f4b-9a09-4e9e-98c7-3833924131eb@oss.qualcomm.com>
 <c2e5e168-bc94-4b17-87e6-8974bb83be3e@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <c2e5e168-bc94-4b17-87e6-8974bb83be3e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: fSmf62jybhZnih3Smt4YNGxcGkeDRiVO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA4MiBTYWx0ZWRfX3JRNKwZHk5vr
 onBMzSAx0IHwcK4tiM7KfvcOgkc2ulIuOqThXm+i+5mY7lJK/Wx72aIMH04Q3bg3OTHnUuLG11g
 u5mT3QHZTeIAC07G+HpyJE/Q81UatIA=
X-Authority-Analysis: v=2.4 cv=F9JnsKhN c=1 sm=1 tr=0 ts=6a4e0c9e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=/bviTfK1dmy+WGcHzWQ0gg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=kc99uptPwIIcf-mWtqsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: fSmf62jybhZnih3Smt4YNGxcGkeDRiVO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA4MiBTYWx0ZWRfX5M6GK7qItgpp
 PZHj+5ZZA2FAPuksZGKsOhKLQmfMYXvL2WCQ5TxpSR+c7SbGmXeqD4ed+cJlusi28SG4wj0Jzff
 OdPBqMfc40Xd5ik24lFl1reHhWs6rrKvN904/YqNfFyL/sZMtDqeiyEVDqIhkCdAzcbkD30DpcE
 UkJKgVnm/E+0yhUV/0gggCPcV8pAa3DLme2nkp19UVdG/Z5RjDqrevgmCcKoFV2sMucBoviszJW
 pms9MtZa6cNW1pkt8dTqrHIvA/zNGw4deAS/p+QI3xNILkNONIzM4sn+49+G+lbQGC087mOT2mL
 k3enCRQ9lDiikqscdHUYqP8XkN/JcPL7UUC/NFJxnGnW5oXehqtYzV5CyAQUjMg8dV1beejuT/N
 86tphYWzQAPzIHtBvM+FtQ7SF9usPwuOCMuOWUnMpWCNex9NLXOqEr02mLQZRUUsPXvK86L15xk
 kVtaG7HTWqaZpf6o1fg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080082



Le 08/07/2026 à 10:24, Krzysztof Kozlowski a écrit :
> On 08/07/2026 09:31, Daniel Lezcano wrote:
>> On 7/8/26 08:30, Krzysztof Kozlowski wrote:
>>> On Tue, Jul 07, 2026 at 09:22:27PM +0200, Daniel Lezcano wrote:
>>>> +static const struct hwmon_ops t14s_ec_hwmon_ops = {
>>>> +	.is_visible = t14s_ec_hwmon_is_visible,
>>>> +	.read = t14s_ec_hwmon_read,
>>>> +	.read_string = t14s_ec_hwmon_read_string,
>>>> +};
>>>> +
>>>> +static const struct hwmon_channel_info *t14s_ec_hwmon_info[] = {
>>>> +	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
>>>> +	HWMON_CHANNEL_INFO(temp,
>>>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>>>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>>>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>>>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>>>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>>>> +			   HWMON_T_INPUT | HWMON_T_LABEL),
>>>> +	NULL
>>>> +};
>>>> +
>>>> +static const struct hwmon_chip_info t14s_ec_chip_info = {
>>>> +	.ops = &t14s_ec_hwmon_ops,
>>>> +	.info = t14s_ec_hwmon_info,
>>>> +};
>>>> +
>>>> +static int t14s_ec_hwmon_probe(struct t14s_ec *ec)
>>>> +{
>>>> +	struct device *dev;
>>>> +	struct t14s_ec_hwmon_sys_thermx sys_thermx[] = {
>>>> +		{ .label = "soc",	.reg = T14S_EC_SYS_THERM0 },
>>>> +		{ .label = "keyboard",	.reg = T14S_EC_SYS_THERM1 },
>>>> +		{ .label = "base",	.reg = T14S_EC_SYS_THERM2 },
>>>> +		{ .label = "charging",	.reg = T14S_EC_SYS_THERM3 },
>>>> +		{ .label = "qtm",	.reg = T14S_EC_SYS_THERM6 },
>>>> +		{ .label = "ssd",	.reg = T14S_EC_SYS_THERM7 },
>>>> +	};
>>>> +
>>>> +	ec->ec_hwmon.sys_thermx = devm_kmemdup_array(ec->dev, sys_thermx,
>>>> +						     ARRAY_SIZE(sys_thermx),
>>>> +						     sizeof(sys_thermx[0]), GFP_KERNEL);
>>>> +	if (!ec->ec_hwmon.sys_thermx)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	dev = devm_hwmon_device_register_with_info(ec->dev, "t14s_ec", ec,
>>>> +						   &t14s_ec_chip_info, NULL);
>>>
>>> Last time I commented this looks like actual ABI break. You did not respond to
>>> that, so I assume my finding was right, thus:
>>> 1. binding is not correct (although driver should be fixed, not binding)
>>> 2. the code still breaks users
>>
>> Sorry I misunderstood it was a question expecting an answer but an
>> affirmation.
>>
>> By ABI break do you mean:
> 
> Existing ABI contract is changed in an incompatible way, which has
> observable effects as below:
>>
>>    * new driver with old DT will fail ?
> 
> ^^^ this one.

When we are incrementally adding features to a platform and like here 
reverse engineering the device protocol of the EC. It is difficult to 
give a complete bindings as we are discovering things little by little. 
How to prevent handling all versions in the code when providing 
iterative completion in the bindings ?

Is it possible to have something like sysfs?
	Documentation/ABI/[testing|stable|removed|obsolete]

but for DT bindings ?


