Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDF93C063A
	for <linux-hwmon@vger.kernel.org>; Wed,  8 Jul 2026 07:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783495905; cv=none; b=GoidykruRpihTsCUXerboQrh4iQ3SbT9JazCtgUmZpUzIkQPYC+yx/DRtZZgVFfVMleJsW1/c0DUzO9eKOMojSMFnT2PaksPdiPn1LCbP4/m1wmetYbjrnIJSoJKy291tUY3zLsBxcEFPRmpHj4xTcQnnDe2IqEvCM6eccnI/o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783495905; c=relaxed/simple;
	bh=bRHwrAZC93czbdFOntiYykQyXzYF6wbZB3hH3rMeWVQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hCUbccZ8UHHd8j0FXZNNVx0dHZBN1HgXnkfwIIF+7KYBjjL94GKiTMmonvJXjgk10SUafB0Xn1mybRYLR1g6TByBcSCyqh4qnOTv9Zg1tjpIPXfdvHptwQFul2k8DqYcfpGKcEmHY+pJhyaZmSOyUF+vcry0f6qh49EYKmXLrjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C/M4JIKG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eqW0kbCw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C/M4JIKG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eqW0kbCw"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842aql1667872
	for <linux-hwmon@vger.kernel.org>; Wed, 8 Jul 2026 07:31:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TzGrlXz/k86ZY0yzNouv6JvvoTJVqGivqV74u7X/MlY=; b=C/M4JIKGO2NdUVBX
	Yyc2Ob+dgO752sXwa9lwqIS3Xpd8DWTGhiBfoWgFP9kiC+yspWQGcIvtcGMkcr4u
	cXhlXn2J+Hp5DSM7ocJvD60KZbv6y4qhmzlj3QlOvN+9nOwx9mOlWlKDXp3aN8VV
	EWNLQKw7VJ6DPkWTcWS1HZQM5xOuLYdPSqnpSJW8fg6uh0972TBWt7JDhR3ebwA5
	Js/00Is0Lscvy4qRTMDXIWNymISI04g4OJ8s1hFfyvS+FR4Eu9wZoAwZkKOTjwpB
	qGF57FXByGddRp5/qWJU1AMxxz1+s7WU7Jb6kIPalQzsVBJDahr+ae7DCXDbsnOo
	e3pOTg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95e5u94t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Wed, 08 Jul 2026 07:31:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51a8db414c7so5579861cf.0
        for <linux-hwmon@vger.kernel.org>; Wed, 08 Jul 2026 00:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783495883; x=1784100683; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TzGrlXz/k86ZY0yzNouv6JvvoTJVqGivqV74u7X/MlY=;
        b=eqW0kbCw4AlzE1n4nDuDs4U0F0ECD52EmpCQiIl9we8Kvfo7dg6gXFPztsoBOTc67Z
         Gd+QF3xdZ1oyyKTk3VRI32dGBwLM4XwJcHBsgyjIrXfngsP8M0U9GZ0fpGxt9FR4vkE5
         B+eDq/rRqHLI6jQSI936IJa+zsTLLijGf/HnAJGIgfvY3ZSm2GIisXPztFIttFINqnvg
         Gpc0OARvy7acUezP0J1r6lZ1F8rvSRiEIy9umB0ZWHZqXIBjEbytmBWwwc8eiGpx0/T6
         ArZILivBNui60myBIrPR9ctmlvwoRRUI1UBCYpHEo5JgqILVJXH71ol7Kw1g/PcRZWv7
         SruA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783495883; x=1784100683;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TzGrlXz/k86ZY0yzNouv6JvvoTJVqGivqV74u7X/MlY=;
        b=ZTPIr0UEkGj/JMAQwoBseIWOr01jR/NpNznXdRui7EKEy307g0DXbTpnhLJLPBnLXN
         8doJeeCFPs2hIBGwCPNTnH9N0O798wq/3FC/abzvYRsOqhHormwvz+hKxuSz5rqurCMg
         47fgSQmmXfk0FKUAOxWcKxOA9SZfcvRoRzZkBADhDuGetM/Odk8NGrOWkHbz23n17cll
         5gqJfITjooZwAW0cvHXCM1v8V0VaawpiS7BcPW/GojvlssEUv2VkIakm5dlJigaGQxwL
         BzcSBMefJmJZ0v5bM4H+oR6Wm/wJSylhSep9g7Mq8lOe8goDTLnBg7sNER0EvKEJoZ0S
         4g7w==
X-Forwarded-Encrypted: i=1; AHgh+RrnSYGNgfEW15g0dUAbwbvjiBghtkXo28q2865Mj05JlU5U60Vr1v88xSdVvim8Yu0Tq82QIkltvS5/5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNbI8qEZYi32hvV0hASHcjOoLFsrPD4pPx9Fs7fy4ZH5/tOB6B
	EMdkbeYqFBIe7if09fvaDPOmvpH29+dvpVCYhxaQK86S0IqUV21iBLQ8qTKGo1W7roJZHt5Olg3
	og8N6P05OQrYFPi+FklTLMryA4ShBwHz5CLqixJ7NiFae90OyKf7T7Y4GRK8m66oTSQ==
X-Gm-Gg: AfdE7ckYLeMc6bhDkJfMEd5b6msVV3Pl1K0/1WVsqpTU1VPJP3bw6X1J3LJIguiZlLA
	z26gxcgrkBgtSe55E2MI0XHZ8Vx5f8iA8GUUjjVh6KH9bT+lTVy7Tgf8OVDNWvXSYMd5pvlPY4J
	RFxKkhnyKls3a+6K9QEKfBzNrff1QgWhX7LnctJdeHJmcG0jctYxUpeYuKzZlJ094P1GFH30zuU
	zxkbLuBlWGHjk9TJ5UXFZU3zB6bVt4MazjLR3pZEWycy2z7MYL1h7d1LVN1GFvvWYCR/f1NCcFE
	ZawfON0BjPzRqFudAdadwvYN7bBwAKEJzxbN3kolMmPWscoxZNacKMEExws7frUcOhPFi/0s8st
	TjiOb8Zyub1LIhQKDMeHpOYSlowyQEiwWjq/ssihJizEJCgXETPi0raBsyOLWWhWiFZ6D/IxLXQ
	==
X-Received: by 2002:a05:622a:44:b0:51a:8c9a:8fb6 with SMTP id d75a77b69052e-51c8b4c2ee9mr16996341cf.71.1783495882750;
        Wed, 08 Jul 2026 00:31:22 -0700 (PDT)
X-Received: by 2002:a05:622a:44:b0:51a:8c9a:8fb6 with SMTP id d75a77b69052e-51c8b4c2ee9mr16996001cf.71.1783495882167;
        Wed, 08 Jul 2026 00:31:22 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:9094:f7db:443e:b97f? ([2a05:6e02:1041:c10:9094:f7db:443e:b97f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e5a572c3sm43480075e9.1.2026.07.08.00.31.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 00:31:21 -0700 (PDT)
Message-ID: <bba69f4b-9a09-4e9e-98c7-3833924131eb@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 09:31:20 +0200
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
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260708-wakeful-cyan-caribou-35fd09@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0UwLmfJm1zxIhd4dzRPolY6GHbFOI1NN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA3MCBTYWx0ZWRfXw+PYpKfkkOqY
 hCm4ejYBTXe2Sf0ZWV81MGiZ7Dl2ehvv033oiAs+8SK4zyswCrF+BRAejvALuJuRF+dHVYIC2rM
 bhEhI2/jA/iZkuimiVD6Pb1c39gm2U8=
X-Authority-Analysis: v=2.4 cv=CNoamxrD c=1 sm=1 tr=0 ts=6a4dfccb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=PiMqHjl-x4LjNog7iuwA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 0UwLmfJm1zxIhd4dzRPolY6GHbFOI1NN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA3MCBTYWx0ZWRfXyVVZe4pywpIQ
 FVXjBkCvgAq/zMkNlB0obUrMYc1mJMXSQEULYbu+0AOe01KVSlfBu/jiF0SsxkIbmrKnZSrXQDr
 /pAHvy4hmB8Ogu/q/zDihPEWDv6IwCJnRFWEAAZLVuV6WgwZTzqCcnrjO4IvH9uJHhRs7BQyRn+
 MggoZBpZxcAzUaFagiEV4wqpWH/b6c/G4qdHb/FAKaf0eqzGgwalhxFFmAtUD0vNdy1kNzmETYN
 jMhkI63R0Bd7hhleFpBPzEj4DT0gTCGeSCpirE0fno05PUk2dlOUC1OnM8JyhLJCrh+Z7n7XWe6
 R301v1EZMAYGaM0tRpBXem0Dvpd1gDV72faLbigeOFCWMw9BF3NU/krJ7DTaDGgVnV0rA3SSVDx
 0x+l/6WB5pZ8F4x3rVGPlFsQ4PzsEYj9FHuJaxnSsoxjwk6Tk/WCpYsCGh429wd2C8A/YJt+gUg
 XFU5YUKkhd2eTjx+aQw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080070

On 7/8/26 08:30, Krzysztof Kozlowski wrote:
> On Tue, Jul 07, 2026 at 09:22:27PM +0200, Daniel Lezcano wrote:
>> +static const struct hwmon_ops t14s_ec_hwmon_ops = {
>> +	.is_visible = t14s_ec_hwmon_is_visible,
>> +	.read = t14s_ec_hwmon_read,
>> +	.read_string = t14s_ec_hwmon_read_string,
>> +};
>> +
>> +static const struct hwmon_channel_info *t14s_ec_hwmon_info[] = {
>> +	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
>> +	HWMON_CHANNEL_INFO(temp,
>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_INPUT | HWMON_T_LABEL),
>> +	NULL
>> +};
>> +
>> +static const struct hwmon_chip_info t14s_ec_chip_info = {
>> +	.ops = &t14s_ec_hwmon_ops,
>> +	.info = t14s_ec_hwmon_info,
>> +};
>> +
>> +static int t14s_ec_hwmon_probe(struct t14s_ec *ec)
>> +{
>> +	struct device *dev;
>> +	struct t14s_ec_hwmon_sys_thermx sys_thermx[] = {
>> +		{ .label = "soc",	.reg = T14S_EC_SYS_THERM0 },
>> +		{ .label = "keyboard",	.reg = T14S_EC_SYS_THERM1 },
>> +		{ .label = "base",	.reg = T14S_EC_SYS_THERM2 },
>> +		{ .label = "charging",	.reg = T14S_EC_SYS_THERM3 },
>> +		{ .label = "qtm",	.reg = T14S_EC_SYS_THERM6 },
>> +		{ .label = "ssd",	.reg = T14S_EC_SYS_THERM7 },
>> +	};
>> +
>> +	ec->ec_hwmon.sys_thermx = devm_kmemdup_array(ec->dev, sys_thermx,
>> +						     ARRAY_SIZE(sys_thermx),
>> +						     sizeof(sys_thermx[0]), GFP_KERNEL);
>> +	if (!ec->ec_hwmon.sys_thermx)
>> +		return -ENOMEM;
>> +
>> +	dev = devm_hwmon_device_register_with_info(ec->dev, "t14s_ec", ec,
>> +						   &t14s_ec_chip_info, NULL);
> 
> Last time I commented this looks like actual ABI break. You did not respond to
> that, so I assume my finding was right, thus:
> 1. binding is not correct (although driver should be fixed, not binding)
> 2. the code still breaks users

Sorry I misunderstood it was a question expecting an answer but an 
affirmation.

By ABI break do you mean:

  * new driver with old DT will fail ?
  * new DT with old driver will break ?

* If no thermal-cells is specified, new code will fail with -EINVAL
   -> is that one a problem ?

* If thermal-cells is specified, but no thermal zone, new code does not fail

* If thermal-cells is specified, old code does not fail

* If thermal-cells is not specified, but a thermal zone is specified, 
schema is not respected

Can you clarify ?

Thanks



