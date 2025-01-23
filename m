Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C679F20E6F2
	for <linux-hwmon@vger.kernel.org>; Thu, 23 Jan 2025 12:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737634786; cv=none; b=YAE+fn0Ew9i1lIjvcgXGyB/kns1gbKqdfrnm9Eqqn+ZTnCpEASdZU3PfXouhkwgO6UHTwwmkqa4ZbC7nuOBCqQu8hRuSfCXFcMZO9fACUFWN+icInuuaVFHjuO9NxI/kWyEPdogzWndXOTRSgvLt7H9cyKstdeeJlQsAN7a0Xzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737634786; c=relaxed/simple;
	bh=k2NKAdYzXBEQPbHp1TZCEi86re+Y04PGu5jH/Pgq7Xg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bgLW09Tcky20ebDUIijxTK6o/YcWE/JM40j+GTU9ibgKVwthGR/cP7FSYTnhnKgY4+z9JzeKXY87pp/5RWLtASd/C59mW/nNydJHHATWSeTRIyZc1LTiqpfZ+ybgvL6f+eaZjLCqQWgZ5pfDe1QtpUzTyf/RHIfQd0zGeofeaWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d8SBvdIN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d8SBvdIN"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50NA7eht010886
	for <linux-hwmon@vger.kernel.org>; Thu, 23 Jan 2025 12:19:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J9CPG/hVBu7eJ/PuvKIffPx7v08z1gelltnc+QQ273Q=; b=d8SBvdINUqctG+Ap
	O3+KIQ77cXm7+n7FdgyW5oj77lj/B7kGynP3NA+TbnmdSC52psyDl3Gkdt8o/v/z
	/7YYXNL4VLw9JGMwLm1O6eC8EaMRMFtWUm98x8XmYq97oaOtku0+M/e1TSyLwY3v
	WpusiGx9nvkLoNAmNpvrdyIfuTNVxQYufEIoLsp/U8mqC2sj2Xah7h4t5k++tlGW
	cyIrX5/5y8Gw2lrF1oRowA/2DB6pR7oL5I1eerdP8mS5qsZyaBA7nvEGniw/We/l
	0tJzoNAP9Zyz8OAu/ZRlh0w76RxdvS13YnoJwcPVpGj9Bqz9kWwOpN+VZsNJiX6K
	jf8E6w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44bkr8ga9e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Thu, 23 Jan 2025 12:19:42 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6d8f15481bbso2133306d6.1
        for <linux-hwmon@vger.kernel.org>; Thu, 23 Jan 2025 04:19:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737634781; x=1738239581;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J9CPG/hVBu7eJ/PuvKIffPx7v08z1gelltnc+QQ273Q=;
        b=Og0kqo2N7xzxQ0WDkIU0kBUewGo8/VvnW6WYw/A0ucFPLqRrqsyjDZM9jmHh0Etx7s
         ViHHQvga0z/BZ1e5T5PrKPi1wigMU/22CST80RtGeKlbxD+A56tm1VrNcITg5zYxslHE
         fxEMLN9i5aWtRYBOQLcSPeLr9uNagHiqe52zy5dvF7lpQruS0smOwXXqIsf+xa6ihqe3
         GA/Mh92zuAvTbs6FPPGJAhluV7CxRyxzN4ghfLci/wKaPRa6PtfsouoolSX6NwTA8ya4
         j4qRuJ5zgRCh4coNK1u3tnvIXOu8baQdycl7ORilZLyD1I+oVKU5Nj7CkHu29gyLU+by
         c2vw==
X-Forwarded-Encrypted: i=1; AJvYcCUOL1MnPyU1HFacWhXQ75bx1h696yK+BQfl2sYFnXFXQOeRhK+B/POWNMPjvukrINF4B3A7jtu6NXcxFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwN0sB7zFLm5LMjifrPB+znul91Fq9qSxOo0tsvvpD8jKo8ytj
	Wvbb0wee10O4EcNKzkNVbcjKGI3YtjBh9gGrGnKrnlueyxHWXBZVPpcuGylhFZXQzXHsyErM2Ad
	vfO9sWXnh57mKtov0I8Gk5SP8nJxUArjOa6ZSNC7OZs9NBWp9ZUNGzlCuZWy/Jw==
X-Gm-Gg: ASbGnct5nuQml1NkFDbV5OFukEQnsyfrKS2mdp0HiHfN+XjH3jN/S/nD3kkrwLWQp+M
	mRVdGe54L+rbDxEPEizUozUEMDzbZxuGKna/qsaRMciVMnaBDu4QmDg7eIWMIjhYXphJdo5//HS
	GvzDJe0uZkexfVJ59kerxynv42sPXi9JVdQSNYhN0UfE7RhMnjYTPZK0Aes74ODOjVwb7HKJS9+
	oT3eKemuj24ZcSbxVuObwzuhB9AaG7SlNLA2uBEPFKWkxqxr9jsjjtjZjiLlVlFFkHujCw8QrJY
	1XjtBzzugjVNjYoW4IYa3SYQN9izYwe1qMOnU1OI2E2RK3jS
X-Received: by 2002:a05:6214:2427:b0:6d8:99b2:63c7 with SMTP id 6a1803df08f44-6e1b21db9a7mr125795066d6.9.1737634781417;
        Thu, 23 Jan 2025 04:19:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFL9S3Cn6Xh1m8u1IJrR1ZW7VnorjrOrlsJRo8NPVU0jyMT1h/6dueqAdo7fGzvWSJ3efppQg==
X-Received: by 2002:a05:6214:2427:b0:6d8:99b2:63c7 with SMTP id 6a1803df08f44-6e1b21db9a7mr125794946d6.9.1737634781138;
        Thu, 23 Jan 2025 04:19:41 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384f87d70sm1079289066b.142.2025.01.23.04.19.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 04:19:40 -0800 (PST)
Message-ID: <94ccb2c6-d68b-4bb6-8eaa-7ff72f575ab0@oss.qualcomm.com>
Date: Thu, 23 Jan 2025 13:19:38 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: gaokun3: Add Embedded Controller
 node
To: Pengyu Luo <mitltlatltl@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-hwmon@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250117140348.180681-1-mitltlatltl@gmail.com>
 <20250117140348.180681-4-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250117140348.180681-4-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wxi_s2oBgSWKRRmOp8PJHa1VHwrxRERp
X-Proofpoint-GUID: wxi_s2oBgSWKRRmOp8PJHa1VHwrxRERp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_05,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 malwarescore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501230092

On 17.01.2025 3:03 PM, Pengyu Luo wrote:
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
