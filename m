Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D79E1FDE02
	for <linux-hwmon@vger.kernel.org>; Mon, 27 Jan 2025 10:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737975109; cv=none; b=b5BDS9+JNmO6ZNLOMNVfJufaYRUgpPqqx4hZ3hjBRaswYd4UC0MiOL7h93F5TdPEI3BsVIZIa6+5f2yAVVyfyTQqFIfoXVZnoaiGGjvhrEiUXJCuvMksw+nva58Pz/AJsPe/sHyKDS4PTaeXo1hGd7hTY/cXFgumRzgdbcrcsDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737975109; c=relaxed/simple;
	bh=mWS+9+694GSsQoByy20+8LEEtkIWdin+mmWpimRNntI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qaEQ57SeCYH8ixRIO6SupOPrIeR2aMnEvt9KSgV8xBjA+7r3tIiwo6cknBgwODjVmjlujnNXPVm+kCKq1+VJcv8m7DLZehDp0EHQzLSqGThxN8o8BEhVCANaEnuwU49r1lBNxaFHOeo4qD9ARZtTlKTPW4MONhIWjvA5c4j7cEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xdg1V7eu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xdg1V7eu"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50R2ELv8008038
	for <linux-hwmon@vger.kernel.org>; Mon, 27 Jan 2025 10:51:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5TAo3NLH3Ad8L2mbH6/7KB9BjVRiKtULeosoRVXBiIE=; b=Xdg1V7eu3kjoDsZ2
	v8jTYEEVt/L1SFFHuWUTtLm+s+zSgCMCaoqjzUs3xsh5y/39fK7ph7BPFC1y/br5
	IKf904vgSs7WtG4HZPvf1F1n+yL/r17jYNfFCU53mZ+wt9umSpPxsB5ofWsIVoxN
	/nzm9Zzb4qprA5Iy/cbAIJky/sioCdBlIKB7p5Q4v/konZ+hzbQunUa/uTi9DB9/
	q8tuVzkZWJbFHqpGW/RqJ49pzuXoKNbFfPl22vdWPm3bg59HiK6iJd0czKG3l2IX
	M51MGi0Q9P2yx4In3OfrY8pNg4gggTZtyRk0ORLZFlhIHWpJHa80x4BPqv6X7AzG
	pCdz6w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44dtn2h83v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Mon, 27 Jan 2025 10:51:46 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6d881a3e466so5089876d6.3
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Jan 2025 02:51:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737975106; x=1738579906;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5TAo3NLH3Ad8L2mbH6/7KB9BjVRiKtULeosoRVXBiIE=;
        b=TIbLBZ9HlIwohGke7MzVgTT362bsM2A8qG1vqhX+kVkBgyFswkRw//IGekUZqViP3O
         As/oSX9z1VtJUDvXCkYK5Kwwcboy3LJGxX9eDfckGKPK5qa/JvaR9uPWCyHd3jNPP8rj
         Q74OD9RWINCyzMotXxUaH9trG3NGMu2mzDjOMqx08G6mo0rPWMKPJehUSazPS46UOxFo
         DUfazWa6c/r6E6gADgcrEHxZcxtuZ0mdx0fYLHa04ehH5cDL77+YQREYNAyRhfF4Mjfl
         4dK0SftBZk56zU1D+ZgxiY3ZH2jGKcAnJyvU1SwkTZimMJzRsGlEGwxcQkZwCimr/dGH
         O+dw==
X-Forwarded-Encrypted: i=1; AJvYcCXtSqQY4FF8Cb/w6B/FWratrr9wZ9AXc3Y2o6nOrh+gUTQ4tHAODWXtUs+OFYsIeQY1D4ZlQt318rZklg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaE/Umoa5gbRku4Q3jOHh8neVPM2uC+aZrBmop/K3nq/93Vhzb
	P4+4jtaZK31+8UNzTkqwp7M9KCpYPkNnS5tzVKuW1yooIRN0uua0yOSgXOxd/dC3Kmf8QXaRiD3
	yX4HPfVyClDKGzS5ydqaKLErBllyKWzLLbnBMLyxD0iRWxExt9d6QBAYtQkG+Kg==
X-Gm-Gg: ASbGncti6DQEPLeNQ8Wkd7K0Nm7HCe1Qans1nuDG401JebbzAeCyczgdwTfpx77I4dm
	xibPmkH/+q3OT9zxz3o+aSnxPHuhUwfj7vHzDzA/dwyiTqGjU4ua4IgVUux7J/NlWLtiwszxWT2
	4xhPU0JUJtQdBkskCEJaYlLG/oO0UZuWrZ/+ojXbAh0lf0IrClw0bazNse7byJKYeco6jZVOY6A
	O7zolWqnO2TEWjQbap91u711KY42WKo3nfkQHqGpJdb622Ee0OFFhQp/TPmyOpmOxOnKmqVIOCH
	kel3/ZlD/RQnbP6q9KGKmsgZ3Fj6WyDMyXllPUBhKksCnyvLKpL4fSdHjxA=
X-Received: by 2002:a05:620a:2710:b0:7b6:c6f8:1d28 with SMTP id af79cd13be357-7be8b1ce456mr1339610385a.0.1737975106234;
        Mon, 27 Jan 2025 02:51:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGmipgG8GM4vQcl4ErqneekUMA+TqdfGQ/TRnU6ORUmcoAw+5fZFYtsSEdXIZ+Fkyyih/giyA==
X-Received: by 2002:a05:620a:2710:b0:7b6:c6f8:1d28 with SMTP id af79cd13be357-7be8b1ce456mr1339608585a.0.1737975105928;
        Mon, 27 Jan 2025 02:51:45 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6760ab31dsm558813966b.89.2025.01.27.02.51.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 02:51:45 -0800 (PST)
Message-ID: <89351850-b7ec-40b8-ba6e-a69e682f245d@oss.qualcomm.com>
Date: Mon, 27 Jan 2025 11:51:42 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 3/3] arm64: dts: qcom: gaokun3: Add Embedded
 Controller node
To: Pengyu Luo <mitltlatltl@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?Q?Ilpo_J=C3=83=C2=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-hwmon@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250120164701.7918-1-mitltlatltl@gmail.com>
 <20250120164701.7918-4-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250120164701.7918-4-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: FOH8z-GOuv3EXZ15bV3XexBHc-KeXQKZ
X-Proofpoint-GUID: FOH8z-GOuv3EXZ15bV3XexBHc-KeXQKZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-27_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 malwarescore=0 spamscore=0 mlxscore=0 impostorscore=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501270087

On 20.01.2025 5:47 PM, Pengyu Luo wrote:
> The Embedded Controller in the Huawei Matebook E Go is accessible on &i2c15
> and provides battery and adapter status, port orientation status, as well
> as HPD event notifications for two USB Type-C port, etc.
> 
> Add the EC to the device tree and describe the relationship among
> the type-c connectors, role switches, orientation switches and the QMP
> combo PHY.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
