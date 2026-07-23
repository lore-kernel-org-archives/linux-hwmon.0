Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D27F3DBD65
	for <linux-hwmon@vger.kernel.org>; Thu, 23 Jul 2026 07:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784792419; cv=none; b=ZkfG7p2eFX6owUk8f9pLU9IVov3x08F0ASN402dqL8Qnd2nkbFvijc/Jp74s9rAyxwTknEoOa9Ho5OCRCnNXhdaFLRsJWwYrkkneTOhX8arkrcHYtIPWJcHFSTnoDML0d2OdFVqQbjqtwyvhhUFQySowFqNSKB+OpQMDghr3vVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784792419; c=relaxed/simple;
	bh=87kbs2npqcqvfJFySp/OWE/pJx7RjfrsrY3bV2Ot88A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M0UwsqmPh6QmTOfGPQBgHtX4GUd5E17TKY/GsW5I2+COIH0mJo+5RGfg614+Ih0h6qwLzWUfIzMjJuFBtq7EJ9RZT538P6EWYAa/fF5/h9g567e8KRKInVZuLkhvNFrQCzrauQnsaLtoJjWY7RIKThkrEx5R6+PRhUwOgl92OSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gbkpRXVa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fiTzx+5s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gbkpRXVa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fiTzx+5s"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N7BaG33030159
	for <linux-hwmon@vger.kernel.org>; Thu, 23 Jul 2026 07:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ISzK1DEaHk+EZOYCpng7ILO6U3frD4mricOPPefehcg=; b=gbkpRXVadTWyCcVj
	s7AMcO7zkK0PWvwy6BuzZjeetuDFHMozlpkN8PdRy86J4tq7P2u9w1/6/ww9EWuc
	hH3xNV79Y78tUmtOB5DnZgde8J6mctvJXwkXdGBrUZrk3wEpFGVy5B70IpYBz/bz
	6O8uw0GiMEpUe8zgX2djHCeELv+ieaPHaGFANVURZj8UuSHyTU4bg8MNUnd7Wl1c
	VURN8BKfL1bV0OJuxnedHz5mM0a4l5E9ZP+FHQIwLI7HsnxXk0/dmePOWX4tbxw6
	H4vZ4hkeDk3sXBet/7B/dsFL40TvCeDC9kRiPQXt6Tij4mD94eJZKQKznUtV4jUM
	vVXX9Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkafw1147-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Thu, 23 Jul 2026 07:40:17 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc86a9ef97so10615805ad.3
        for <linux-hwmon@vger.kernel.org>; Thu, 23 Jul 2026 00:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784792417; x=1785397217; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ISzK1DEaHk+EZOYCpng7ILO6U3frD4mricOPPefehcg=;
        b=fiTzx+5sFSAwBZJXcb+cK4v7pCAk81H/f4Qrxn/EUHqRbGFeQqP+69dgme77tW+1RP
         hAK3eW3TCkMhUr9jJ0ehyl+yZrh39hJVYm7+98RYWl20XoKruit3WqTBqBcj53xAvf56
         AeOJ+8cIW53mVtcM86EQJ7Hu4eFAg9OPJsuQJSb5hrt1tvYpeIpf2ZdfccRG/dkXarRh
         NacwSixUiq9Wie9J7Tb0e+YegjUHPeQ8jtWCDUFHAHIqa3hIDP1c8EmrbTN8ZMpKHmKd
         bHbKUkALRabKsuEE/7alhM4Qwpr56X8f02kQDkYyUD8L/ZPjyJV+kkKnIUqxrlV9jQU/
         zocA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784792417; x=1785397217;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ISzK1DEaHk+EZOYCpng7ILO6U3frD4mricOPPefehcg=;
        b=WWbowIdXSfuv0xW5jBqZjUDrJ3eW7JL8AKvkrcWzymAL2+cXtv5rcFNgOVumBUzjIE
         aTVolxuXICfFcVdHq1WbiUX/asvnu7RfKwTSWi9ibUacS2FL4QfEXiQPJgg2kwesq5pw
         4y1jsnFSkgWI6YGC9C3leRnsOWlHRI7Ul9NZDOIKZ3taAXL341/NF3eomgQFqHkrrL4C
         po1pD3fM+0iSegUPxfuTpZpZlWB+eE8yiLOx/2Jrp9AXwvwvMVmdSoXA+eYEkJIcjrbU
         t0t6CvrzFy4hngdafxYpQLGihDCyUMUEk+Hnr2AsewLhb5r1vwmTyoNNEVjFyvn1WXGS
         POWQ==
X-Forwarded-Encrypted: i=1; AHgh+RpOIR/drez5/rbxpcCDBwvAH2Ge9dbpZ8n5A/17o0JYc1NqSS3+thzDaztV1S+0zx58ZNE2tU1iS4deUA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg60RB+g5LTeSwMdHcfPfq2dIVZgLgFIzUNDxAjDRB0vfy/vs/
	yF4AJPNmWdAVmoa6tQlgTiM2uUTljTTWOzE/KdnYi7gd6AFJLfQvbMhX25iisgk6Cp6D8/RdQ5i
	NpmYMxUsPvt6RFMIlZfddqO/EgWRV7pGXtUhSIICLALkrJ78/6l8AmMYuiHugSCQSvA==
X-Gm-Gg: AR+sD10qtzBeRg+58U/bQvHHlqEZTh9LoZUohTnKO/TeGgLe2ewu6mcvyriWrvDjyLA
	XvOo3394KbPKI01ZQJAQmxJJ8HFaKdAxGAQ97IKUsasgt/3uSHrkEAxr15Gpo3kEaMRc7/qiNxS
	gD8xsTz9AlRaAEy+CKlmSPkkgJZGJDVmY5/vxv6VmGwU6ZanlzXjHYxoQMyRgqVhXQEbkMQJVRb
	YJTJYVdw0SCqi5182BVZqefj/TZwH4ud+RPHAOfuOCeEQy7zMZZsLpVITXQ7HJnU05OKDQ5Znym
	fefzDkTgOG+wHSaR/pyovAlwntJdmC2XhJoWWkFcEzGRMkkHyQ1Z1kp7i9Pmz0XtjjMitNnRpp5
	eMOddi/wwIoi/oLpL9k8lltb3un7/mINmJg==
X-Received: by 2002:a17:903:41ce:b0:2ce:8e70:3210 with SMTP id d9443c01a7336-2cfa7436e9fmr24584775ad.16.1784792417168;
        Thu, 23 Jul 2026 00:40:17 -0700 (PDT)
X-Received: by 2002:a17:903:41ce:b0:2ce:8e70:3210 with SMTP id d9443c01a7336-2cfa7436e9fmr24584415ad.16.1784792416640;
        Thu, 23 Jul 2026 00:40:16 -0700 (PDT)
Received: from [10.92.198.88] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efd8a9csm28597255ad.30.2026.07.23.00.40.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 00:40:16 -0700 (PDT)
Message-ID: <1dec53f7-53a6-4905-be0f-96c3acee8938@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 13:10:10 +0530
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/10] hwmon: Add Qualcomm PMIC BCL driver
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com>
 <20260722-qcom-bcl-hwmon-v2-2-febe2805e17b@oss.qualcomm.com>
 <amG0f57O5-e_Qg5z@monoceros>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <amG0f57O5-e_Qg5z@monoceros>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XNkAjwhE c=1 sm=1 tr=0 ts=6a61c561 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=BWQAxAc5KOlRlpeuKSQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: MLeUOIUKIL_i6sDbw1P_V_SSwZSe5I7-
X-Proofpoint-GUID: MLeUOIUKIL_i6sDbw1P_V_SSwZSe5I7-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA3NiBTYWx0ZWRfXzNDhFpNwI7Jh
 2f5tFDvcqE99GmO3xf2Yun0GPUYtY3oVucoo86dbyekAiNPdzxPISkzHAO19V/dKvBkFqjxTJ//
 Av7IF/D4hutxPwtyNK6zApsEuVZ5VRs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA3NiBTYWx0ZWRfX3veNlRDYGf8k
 P44U8kl9b8bZ/5vDm2XcdfsSK2Rp4SKaV8rtFMS5AVla0V7j2MGChxcfHXzUKKbxazj2+FS/28A
 1rQEF3Y3OcrwzHj5ZKu6yBhCZpQ6OSNUSsJk8GQiIUYIzolrCULSGayAPXNl6n1VSM7GDrbilS8
 b0ovaPo6DsFXl+mRSQOsNxYlJ6LXgaS7IgMuNY5zNnFG5LSbs27SG2RIxLOD0CHkE1risX01Nfb
 7LzuQ8tVgTTXEy8bxb97XuusqCzmo/8FDbayaCgyiy1x6UVoJRP5jHmtVbSYCPE4pijHSW3hNG6
 SuhW4wiUzGwM2oCOg1zJ7coYfAeQgFl1Za1Mra/kXdffl6WxD/XEDdKFDPFYnup8sIOXbRXjcew
 pYhxv24XdjZecURRUBuCFq4qlUbGxGg3JKZPLpd3X8SJWtwXNQ8hDot51e0Q8n+0AnJjT1qs6cl
 GI4yGFVPKBsqM2qTByg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230076

Hi Uwe,

On 7/23/2026 11:59 AM, Uwe Kleine-König wrote:
> Hello,
> 
> On Wed, Jul 22, 2026 at 12:00:07AM +0530, Manaf Meethalavalappu Pallikunhi wrote:
>> +#include <linux/mod_devicetable.h>
>> [...]
>> +#include <linux/platform_device.h>
> 
> <linux/platform_device.h> already provides struct of_device_id and
> <linux/mod_devicetable.h> will go away soon. So please drop the #include
> for <linux/mod_devicetable.h>.

ACK, thanks for the review, will remove it in next revision.

Thanks,
Manaf

> 
> Best regards
> Uwe

