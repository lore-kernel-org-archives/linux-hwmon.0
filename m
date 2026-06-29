Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54A73F0AA6
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 08:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782721622; cv=none; b=IJN8JnN7obQR4lXee9/0OUkI+/9frqcPCH41r+cFpwqrSpKPpnFRCxZNV6AcxOA2JWiPwKEk2na4XwxMRfO+P7E7QOAYlTUrjbbAQhpuiftuSmP51q1CRFCk9ooJHzKPxPOJaLGW3xOF0+oZ10SvjukzsVSIIJyB4qQPEhshFLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782721622; c=relaxed/simple;
	bh=/FQMZ8PTl30qhjjreoBbFa/jRq7gSWz9M4S5QD2OzHk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T/LDS3doRwy49tHgcP92DV2Ngjd4tmuDYP8d1ESwG8dNzD+P1Aii9sGsOZw7TOuwoZOskto8LV8H75sRJgP0VAOwl/2JHJJmTv86l115wPRHD//jFd0g+dntGI4ppTtD2brb1hB5oDcGLwzP3dosj30w2cbVQR/etll3NEWkqRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hoUzKdaR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kNkvPAeR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hoUzKdaR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kNkvPAeR"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6qvwo2076267
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 08:26:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N8ug/TssIPJ7efv2D8UanZxQcJDn+5rN972tF6NNCZs=; b=hoUzKdaRD6FMyLd3
	M5ZZ7fE2hT71BQnuEBDeEaG0wry1c4ziwOnRI03A1/0HaRBbae4JBdkruniNK4eM
	YLWBgWuu9FGXsY19/IHzIF2R9gL55gtYRpookPDcGH7wv7c8DW+L2TZzSPiF7qiX
	NdY7GjyrMqAKPeDk9t/aT5fqvvs9yJ4s3mySlviZSDES7fD/xwNdGxJjCisYQEqD
	bn1drDvr+fUVtdncoR748FGxgqx+wJJ+HBVCfrzFJUCdCxPz4KX954BLwIomO13U
	Jmh+MWCKIptoD8hg0G0NujT87IEYDxsZ2swI2jUGBzJM84LpqJGlb036j7JljI0K
	kYrPaA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kp7gd5t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 08:26:57 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ead919557cso4629546d6.0
        for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 01:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782721617; x=1783326417; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N8ug/TssIPJ7efv2D8UanZxQcJDn+5rN972tF6NNCZs=;
        b=kNkvPAeRV+7HKdbXvRHMIvdr5vkkExwPnkDLkeZyzvOsPrcFc4NxUGPqUWAPvlITqq
         FBWn9Fp4nBjEfjyArdAHufnYhHfiNyHVC8Wva6kj6tgJuhbgW7do0/bvMIul22XgdprQ
         vqPNyDBRfrbWfBY1dyTcdYgNZH9hBSxkNY0dJmnOX+PZnI2uGAzbI1pvMsHL1NQQhT+0
         CjNqU03soUClUxgiSmduK9eTpQ1RbIYz3zDydXJDZMzEpnjNia2N2yVTYqTrsGTiQpsN
         JkgD5QTUOmSgKyslJXCvwVNEKP+vThuFOt6Upiv9DFKPXRllT88ojoEpQHGQiBUr+oHm
         TmoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782721617; x=1783326417;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N8ug/TssIPJ7efv2D8UanZxQcJDn+5rN972tF6NNCZs=;
        b=ktyiP7Z/8a9/Uzmx16iRocC/hc6qRVWwSkuHLect1AGK545LMDiedBbHu8jv7eDurl
         2VLs/9IyMlfISf0HqF0jkVmn2DT7hlncyiCu2GYFmjIjXJnK9ilD9UKYL7IO4sGVCTfg
         jU8X8W/JZ3r9bwHxdQILy32fyIPPyXc9ke1XjG2I4rfo0i8PngYj5midHpwW+MIB+Lv1
         Ug2NSorUdPiME5/ZOKTMBEZrklpXA+xSXlfs9pbqxCxS03yHLmhcXf0yQtqS1wT7aRJV
         jQb3azELFFs68iuqrO2clml0MY1EpYNDiJQGXW9aR8wcYBmnJE5V/8VsFovQygmcmkpo
         Ft8Q==
X-Forwarded-Encrypted: i=1; AFNElJ8Wm1rW9eIItHCPrsJO+Kzu5YhLHuNoJTV1R1sOTqJnsNxwrY5GslAhbmUMSdcfyhBfFApqdxQQZ2tF/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6SfLw2kzWe0Uom8PKl9lymX9JT/vn88x1dEcTgTQcYdgpPY5+
	NyFIWjL9nHGLNvZeHZOMNwr9ehqgS+GBoNyKDyYiZhxmyCQ6eBcnpobd+qtGFE5pTKoaGKcPkWz
	NBjusqaj65MV1K3COBa9b34JsU9qtroH0Juip0mLLSm7VN8QXsbvPr3Z3vYpnO9OMpQ==
X-Gm-Gg: AfdE7cnNV9mDG0zFrv6XCz56WmMRNHtHwHrPuKaK65kdg8v2OC2KQ3Wb6N6OtVKOLGd
	YPfdIqLRHtCYR2UPGwKiY9u9GeA5Cnf89OB0+TrjJUDs3bgDHku4SoxnMM/GSpkeuUY1xSsqLst
	Iyr3TxHVbiCR/z/eJqdUXOJw2aE+uzAlgInZFkQqxHE7KEnU5J0tIS0rSWrE9giD0ZTtKXmpi1c
	ngOCZnQK/YtsZF/QtuwzgYjxeG5loQmtHlm7I+ypbVC7MrwN7E4LfE3Hi2DYQtlkemQSEtcdQP5
	2uReiSV/KTsYWfPlDZNa1NPcDB7Sxapkxvj5uBDPWwXXpz0cC966On1NrQYZl+wcFoLG7jQ2wcu
	etCjRJK5EK2k4vtkw8FqiK+3fLQOckMJtC0o=
X-Received: by 2002:a05:622a:50d:b0:51a:8c9c:7de1 with SMTP id d75a77b69052e-51a8c9c830fmr85186961cf.11.1782721616935;
        Mon, 29 Jun 2026 01:26:56 -0700 (PDT)
X-Received: by 2002:a05:622a:50d:b0:51a:8c9c:7de1 with SMTP id d75a77b69052e-51a8c9c830fmr85186741cf.11.1782721616546;
        Mon, 29 Jun 2026 01:26:56 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c124e79af45sm234316866b.25.2026.06.29.01.26.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 01:26:55 -0700 (PDT)
Message-ID: <2efc0f6b-3dd6-4267-b587-88c638f02be6@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:26:52 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] drivers/platform: lenovo-t14s-ec: Add hwmon
 support for temperatures and fan speed
To: Guenter Roeck <linux@roeck-us.net>, Sebastian Reichel <sre@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, bryan.odonoghue@linaro.org,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260624210825.264454-1-daniel.lezcano@oss.qualcomm.com>
 <20260624210825.264454-2-daniel.lezcano@oss.qualcomm.com>
 <akEj6XEByCOkuJaY@venus> <faebd355-a9f4-4360-b123-87103ac512e8@roeck-us.net>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <faebd355-a9f4-4360-b123-87103ac512e8@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA2NiBTYWx0ZWRfXyW9O0AXI5ZcO
 /zNFWDGCI/GAhBsZE0dVWXvJT7LZT+Thk3vwjk7X9pjqZ8JcbtpWCCJSJvRGdM9vRhq4B9AzMWZ
 aWh19rsx9q0AUYcXGJkhfz3o9xN+DU8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA2NiBTYWx0ZWRfX2c9TQXyEfIFI
 rFo+zwE7Pv4+e+r4zx3x39/SmVwcaPwZB1Tmvijt5n2hy4fjV2mazE6CUrO2ArEvu0E3LrcPJWf
 yQpKLRBRQzWCufaKRn79B87gquA8pco4adNeMcN9IqXV8dxwQtX+ZOTl3kZAWTnI2yBU2vg443i
 ev2vBFfzMlHOiTG+fyQQBQG6FVJ3BI9ZXdUTmLymBkrV7x2GCWcOqX60QYTUV7WyNrdac9wSciY
 DAzlyeZkY3d8aBniTSyZDNdUFx/3/9cB4P8FQrV62vnEvPKIYD29HjR+cK5pYma5MQmJq6g8UuU
 /eBoHvbPyEIqwqd7cvkobM0UrFSNlQAXXNMytQ2/rvCpSGT/pJNS3bANAVdYilkJ1eZYdIoVyx9
 ClihBpthmgYhrOE296SQMt5n8fhVY6z1f8gMR/tShJayTWymlv/dXkI/in2rnKpRluTOiSMZKip
 pUVjhzbPN20Oq9rCnlQ==
X-Proofpoint-ORIG-GUID: BEW8gyP2OE0yHmDsxb2d08lxxXwmyTnj
X-Authority-Analysis: v=2.4 cv=MZJcfZ/f c=1 sm=1 tr=0 ts=6a422c51 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=zEmzfJwlJ8pfclmQ7WMA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: BEW8gyP2OE0yHmDsxb2d08lxxXwmyTnj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290066

On 6/28/26 4:02 PM, Guenter Roeck wrote:
> On 6/28/26 06:50, Sebastian Reichel wrote:
>> Hi,
>>
>> On Wed, Jun 24, 2026 at 11:08:23PM +0200, Daniel Lezcano wrote:
>>> Expose the Lenovo ThinkPad T14s EC environmental sensors through
>>> the hwmon subsystem.
>>>
>>> The driver now registers a hwmon device providing access to six EC
>>> temperature sensors corresponding to the SoC, keyboard area, base
>>> cover, PMIC/charging circuitry, QTM module and SSD. Sensor labels
>>> are exported to allow user space to identify each measurement.
>>>
>>> Additionally, expose the system fan speed by reading the fan RPM
>>> registers from the embedded controller.
>>>
>>> This allows standard monitoring tools such as lm-sensors to report
>>> platform temperatures and fan speed.
>>>
>>> Signed-off-by: Daniel Lezcano daniel.lezcano@oss.qualcomm.com
>>> ---
>>
>> I gave this a try and for me the fan data is always 65535 (i.e. -1):
>>
>> $ cat /sys/class/hwmon/hwmon66/{name,fan1_input}
>> t14s_ec
>> 65535
>>
>> This is with the fan running:
>>
>> $ cat /sys/class/hwmon/hwmon57/{name,fan1_input}
>> fan-controller
>> 2564
>>
> 
> Not really my concern, but those names really add zero value,
> and I would argue that they do not "allow user space to identify
> each measurement".
> 
> Also, do you really have 66 hwmon devices on those systems ?
> Seems unusual.

There's a couple dozen thermal sensors on the SoC and each one is
registered with a thermal zone, plus a couple here and there for
other onboard peripherals (PMICs and whatnot)

Konrad
