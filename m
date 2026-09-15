Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF314746D5
	for <linux-hwmon@vger.kernel.org>; Tue, 15 Sep 2026 09:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789464215; cv=none; b=SsLWW02sjFm9YtyNPbqmLcU/pB8By5hcihFDCZG1mol8ScBUg5yUFFJZHBIp9gtgck6unjZEOEEBCKnrgnDfdP6rQvUhplGPhK5LRX9l7FCKQG+FezUKnzjuGi65LOV8rNfSWnD7oDu3AJ6yJTv5yE9Qs1+/tIp7k0gHttsXrxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789464215; c=relaxed/simple;
	bh=k+B6OmVSZRHF/7PniO6p8HutiPOy9at7ASl9vPW22Ws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F9ta/9rv2Vv314WENzGsl8IY4ap+xGL1Vt8ZgnLI+xOfjAUseQtyuFo8hJCEUjMWrjGBWha4lOkeMu6xeF+kGFSskl6KRPwiZ6qPtuz5Iz43wVcjHOhSmodIXic4CgrhIghFAuywPP0gp+9wew6YAlJz5teBlXfPRyWr50G+iRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HvBAdIxh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XyB40/RQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HvBAdIxh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XyB40/RQ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6Z7Ch2167838
	for <linux-hwmon@vger.kernel.org>; Tue, 15 Sep 2026 09:23:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X5n50YcPWOwyVacMh95fTxMW4+kIe+YWNsQL2QT+trI=; b=HvBAdIxh2Kp/+5m6
	LNzP9NgnaHxpNQK/P7OrE/guR2KqcL3Had2yRgXxmgE4MuAKkdKNYaad1YV1Akkk
	N3dWH9oxOKTbdDQl+eEatyxEeTkq1PMMhipEnMEwzHBlCcQ8c7a+rAjoyhzMvbI/
	7c/BeI4koMNzcrsquPrDw3++2cCrKfUVaiyQbir6et1hqB5CBifqe5sLalSuYz8b
	l5tEaTj8L4tC98HiwFvq3SvmKYkIU5agRE2zae7URkaQaLi4VUk2U+M9/738444f
	FP9vRKTJ4HRFv3ygyb3t/bPXYhb5Opf7U5lztpxbzE4Duxus0lpb3oIgDc4PUK2G
	F97uFA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpx4s99ux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Tue, 15 Sep 2026 09:23:32 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-86917d18880so6611976b3a.0
        for <linux-hwmon@vger.kernel.org>; Tue, 15 Sep 2026 02:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789464212; x=1790069012; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X5n50YcPWOwyVacMh95fTxMW4+kIe+YWNsQL2QT+trI=;
        b=XyB40/RQwfLUnhMMPFiQNq6xnneFQ3zBXJ58qtkJgyfIAQPWsNQjqFDb2C4nTHIN++
         TrQ0bSWUxAM/OJODFXLNDdVfylg5uLcaRuJ32u68bPkC/h7A9rG0/7EPgWSmatOfKnmK
         6aFd8eT/NAez+K3DQCZYs4DJMG2wDPkVKgXKyX7vNIjLJUIJBi+tTQShraRx+0rgv/aQ
         yz6it1bAQhXkXw9QhZGb8HXpCAMmx8TpKbvBpu1+BKPImryYYj6zMUUmYp7wC5ZXFv8L
         7pbS9S1u2PTPPZtkL8M35XI9Dwu+vubSSQxM/tE7IFtsjxjEDnuBcwow3QnMGCeomcV+
         vLwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789464212; x=1790069012;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X5n50YcPWOwyVacMh95fTxMW4+kIe+YWNsQL2QT+trI=;
        b=UkV3kfnHJYbLbX7LupDlYQ080Rzk56ezp46IROC5A/iyQ/BOZN91Tss2XUh1RyhHU5
         lsqvRp99IaQkczQsrjDoaijzY2gG1Ub2AJjkY5nJQ6DoIDWURX2s1GrKPAesnRsTSmco
         S9giazCXR5RftmwdZ6MhKGPgNRlhoZ2pEjhZKZOGtL1t7UdU7IaZTXvAnKpllPXceBM8
         mU/5c+qYY7zp4cCl4zV7nd1htf7lc6xSPGk7lH1Tg0ORqRe2v5Qb9qdcoKyrkuOJUiCF
         mpfbxRe9PNkuIaqJ7k+FPCGzL1xlWGCWOOzC8gMsvQBmUsYfk/Dw7TsRucuoWHDUsFLI
         uHSA==
X-Forwarded-Encrypted: i=1; AKwUvBw9G5b4QXx7YAUbBmOq+Wu/b0fA2CN04ZrK7JBTfxz35Gs108XognFQczPGnuDmNIWFCKP9S+GK/5c5AQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kF6nnTDZMXnhMbF0fEkdTipoy6UQAt/rLpae6mIN9lMYhAeAh3
	R0OXESpdHPqxEUGV/pCOQngn/yimCgTmNSvl+/TAPyPgH8ngVajcFK85grxcJAUn3Lq91zm3xyI
	X2jtFa3P7wP6QH07H0N+XbXqeVZwz+I82Gvph3APFXoCaVc2D8dMp2eLna+Ae/8qb8A==
X-Gm-Gg: AYBFou2wWIXlT7xdZPumbAwlCJzBgZzEJKaqiDiVmR2nX3VQPgmI1suybwaP/1h9mgp
	AcnaY3k02Folj2ji26IG6PWpDgc8RiSvO9q5hrZBgqUGOikiu8/diKlO1iXOwUQLQVgv3Tw3bNO
	izfpJFx/i8Eek8BL3TjoXBgNa5l3Md9G/KwVDKtRz69rp5edgDRPCT3MBxWy1p+2xadWTZ/RDN0
	3c1EMMEqcoJxorzzD5juuZx0yvCqBrohcGCxHVJIerNx8kfmSnOezKW4wyZUjdU9iZRB3D24BcD
	Y/bX8gTCWFvOhtfhNULAqxGBVK+EUoWUxnqCaLKBk6Uhrqxh4g4404x1TBICsmM3mPR9TWmhvPn
	qy4ERVaiAhuILwPO7zrHW3S8=
X-Received: by 2002:a05:6a20:2d0e:b0:3c4:1c9f:d7e with SMTP id adf61e73a8af0-3db4039fa7fmr15609060637.6.1789464211827;
        Tue, 15 Sep 2026 02:23:31 -0700 (PDT)
X-Received: by 2002:a05:6a20:2d0e:b0:3c4:1c9f:d7e with SMTP id adf61e73a8af0-3db4039fa7fmr15609012637.6.1789464211403;
        Tue, 15 Sep 2026 02:23:31 -0700 (PDT)
Received: from [192.168.1.6] ([171.76.86.190])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ee07f2sm29591306eec.18.2026.09.15.02.23.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 02:23:30 -0700 (PDT)
Message-ID: <73db10fb-7778-44be-aced-562aa1039404@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 14:53:24 +0530
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 0/2] Monitor Yoga Slim 7x EC sensors without taking
 over cooling
To: Birk Skyum <birk.skyum@pm.me>, Sibi Sankar
 <sibi.sankar@oss.qualcomm.com>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap
 <rdunlap@infradead.org>,
        Daniel J Blueman <daniel@quora.org>,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260908135801.81436-1-birk.skyum@pm.me>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <20260908135801.81436-1-birk.skyum@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEzNCBTYWx0ZWRfX39C7+LQk1gWa
 3Ye5rMshVhofcFbRujY8atb3fgEAc8vx0MTZsWGE6pDUCrhFaqrz599lsScog+j++6TT+HDK0Eo
 l/OkmskuAKYBF/1aS5tXD1tPaco+yws=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEzNCBTYWx0ZWRfX9oaODjMd36pF
 O0v2WaBcChqaV/6//GCQNJkvOzdpaS5EhA5uhJI9f6y8atz5iVnYD31uwD8H3kxeg3Jbz8y8SWy
 QHxxOzhy6kdRyyM7BiWWh5h6Oum428QYS1T/xUjN2tsRU5MJjPLvnVYWFgjnLYNN65px++zRPmV
 IRItYpzqc4xvOOT9KEUO9taToPOWeQRn0mIES1MHo5ynzXVLC5DYmMiubhIdfCWmCNgidV4X0xH
 49ds5+MMYMtQGaK2AchYQP8dcDKTRNw3ko3OCTPppNyDTItdCbjHE+n7WJH38p/7dHaRQtdWHS6
 rURAypWr09pLq3F0kgIIdqNU1LM7fQVDaWivVgdUI8zcCgi1SokMvcc0J6CAlKK7cLx+ZQVksD5
 N/6un7be2ALIvmLeeR/DmLAksWu6WJ3615J5xmWR36qCOrDtb6zPRfTdB2Q7uwyGJOoNHcxzvj8
 AueUtzL+aXiAOMwEXcQ==
X-Authority-Analysis: v=2.4 cv=HsDjiETS c=1 sm=1 tr=0 ts=6aa90e94 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=YsbRjcmUuq6dkflYeO58cw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=Aa1CV5B8TMOsY60AgGoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: _YKLJIsAU9xH3BoPjcfvDV1FSEYDQ8Yt
X-Proofpoint-ORIG-GUID: _YKLJIsAU9xH3BoPjcfvDV1FSEYDQ8Yt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150134



On 9/8/2026 7:28 PM, Birk Skyum wrote:
> Two design questions for this RFC:
> - Is this read-only match-data path the preferred way to accommodate
>   the Lenovo firmware alongside the reference-board work?

The read-only match-data path looks fine, but it should be integrated
with the existing LUT match data. We should not replace the current
match-data usage.

> - Should the pending Lenovo binding omit the qcom,hamoa-crd-ec fallback,
>   given that this firmware cannot satisfy the reference driver's probe?

If this firmware cannot pass the reference-board thermal-capability
probe, I think the Lenovo binding should not use qcom,hamoa-crd-ec as a
fallback. The fallback should be used only if the device is functionally
compatible with the reference-board driver, not only because it uses the
same EC chip.

In that case, the binding changes in Daniel’s patch also need to be updated.

-- 
Best Regards,
Anvesh

