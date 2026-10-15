Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8400B4A68AA
	for <linux-hwmon@vger.kernel.org>; Thu, 15 Oct 2026 08:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792054727; cv=none; b=lo1ZtcrS62NSTqrImDpMQPxbKVDYU4y1iBTe5CBT06CxitFuKZMs8rb2eJhf+FETF3C4PNR2b7Cn69NY+nYWY7SG8j9WEbEY9JWoOewlX2Az6Y0Mr4QJtZaVSN0ainDDbwvHa2qaSSvvito0OkTVTvOslxucQQvVCcjARdxgzZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792054727; c=relaxed/simple;
	bh=A4/JKd8Bel05nQI0APY4HDpLZlqsnNWXRk9ZTGOuc2o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pb2tSEsGMjB1Zh+9hOestWydiAy3cQSwD+0uTlja1llVDfz1mv+pAg/qtbhlk0fLtG3h9bvyGOvYefrP4+YbYZ/cK15dvLfRILZKTOWxqz7R6XMlaRVszCtJTvnTfYW8Iowdpc5h8ELnwYCIBlv4U6d0md+UpG3jJTgRkgSkJbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g9yL0Acz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iw7m8kX/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g9yL0Acz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iw7m8kX/"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F7l8ug3468940
	for <linux-hwmon@vger.kernel.org>; Thu, 15 Oct 2026 08:58:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vu9KbfWHprfYt8Ll8VBeV6KksXaA0Iz6M9e+WSpON4I=; b=g9yL0AczBPiS7fyO
	KhxwwYogST3fUzB02H6TT04AfIWJyGGYjhlCFLJXBmbWeHqUsCD4akFzKT01+Zov
	O+b/P3F8r2ND4nm3s2SDCSJ/XEQ/RefVZuPfLqrfBhvO4r9lpcQd3kdKoKrvUY77
	kzuMlWqGB+1VI1w5O6MMkKzjGpC7/28LT8VANJ2zlhoyLukE5Mn5RxVwFaWhgmP/
	Z++cu6pIc45bTM6LnMKBFdZ76K4G+YxZVCWnEsvVGzc1jsDIoeo1pl+PuRB7zwuW
	oCPNpj3lBFHXFjEX4UeO8hDnDouZJCl5uB22vAy37jjHLBNNO0Xfb8y5ZFLFUov2
	FPyCoQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hadd7bcru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Thu, 15 Oct 2026 08:58:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92eebb130dcso91403585a.1
        for <linux-hwmon@vger.kernel.org>; Thu, 15 Oct 2026 01:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792054721; x=1792659521; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vu9KbfWHprfYt8Ll8VBeV6KksXaA0Iz6M9e+WSpON4I=;
        b=iw7m8kX/11MxeFd3fT0aZMvPt+AJylqTyMmHadMiwDd0BLwz1DKoDaUCioF525AuG9
         mYRstbFuY5Cxn4xP5v3gdu0qxIc1OSdxtltrasMRbiBDunosKuUL7XG+h/yhGDPoiFTu
         Qol0F78BMF67SIdBckHVM9Ii5g5FxdW9QvleHGqbKkhz3Oqwk6XBZ2Ov6wwJ6HbXPsyb
         OycEDP6s1cc9pHDmET9/GNhGiUdv2cQwCekuEZbTlI3TuT1nJPPnjY8ttxu26TJgiFAg
         P2kZvqYFtXDzR5txGH3YTWGJ/nMLRmnqp8xndsgiXxGsZjNeiyEIJMDKg+equ0FLYy2Y
         PxFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792054721; x=1792659521;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vu9KbfWHprfYt8Ll8VBeV6KksXaA0Iz6M9e+WSpON4I=;
        b=dPDNACI5Z27RL/cHS0iNs50X4IMvdSHZP4uIZGda0YlVi+y9qtnhd/9TSPkOtoQ5Z9
         vFOYF1rhAAL13LdbgAwZo2BteBMniIQVMuMVAwqkGiUowSTO/PUsVKvGWPOc7H0xivtM
         xY6w4kHEI/LrTGmZBJQW7yGv/FHudnXCoLJfahhS1ZM6f3PkZyGHzPuK65GHfn6GCbdK
         SRzcamfdxmUiUjQwzyXkPRHVsr9ZBdfJulaMivNgNL32etYimFQHbGdCPcNzNUMywKSz
         7mwqvKPyyvRZslsBiHH5tUbdhP2QHgI0IlRBNeB4dlAHjrDl3Lq4UDjnVclWRU8nNxaR
         aoOg==
X-Forwarded-Encrypted: i=1; AKwUvByfb42w1I9GOqzcycFBWpTxrbsGM41vH/xJ8N9/435Ax+uIlW1vtaBD6u6vYcR7o6cAIl9zLLqWtghOKg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLg3Gs0efYIPzujLuHP34dc/RIMdNxzVQUdZB++OE9HLYXI5Zmk
	0a+pccszRMd7Rr9XztTHHCeo4wbSfPT0EQfUi5S1gcJit/Yv3YEFrisM8M6mzAxYAWsffVO77fa
	7F5LbP6CEnEy2b50edyc/tPccHjL3KQIuQZVEIhwLnIcn0ogUnjR0+Z4h4mtVnXoNTw==
X-Gm-Gg: AYBFou32uLW6pzv+x+LdjmrPPMaRG8DlY6WdO4xz9dZg7eY231RlcMfR+p/VC37wnT3
	4h0Ghdeal1l3Xd9BV6cBtP0HzfGsq/DOp5xYMstF2YRj/07zRt+N6oC9yCtenqGWC9gk0OVrHBv
	xOKfvdfRC5Xb5FA9N/tI6kp522eVfXhsEFqJzYDgx7H4SuWZpO8c/QJGHRWZgmF0hwJBNCicuWk
	zglGjxkSoSLb7Uuv6GXYSX+qSpbbjxVmIaXlWl9zCJh8GuxVf//XhbT8o7fgj//wo3gxjeeGTRi
	gvq4CHwaIMOpCTqljNgy2lEKeiXlN5n8cFR2HBJvuKCLJ9o0Qv3I/lXvbd3n2VQbsxmgY4QWIOk
	q6aJND8Z6CloDQ6XOg3RQgg==
X-Received: by 2002:a05:620a:1a17:b0:93e:70cd:e420 with SMTP id af79cd13be357-93ebd2605bdmr3480586085a.5.1792054720710;
        Thu, 15 Oct 2026 01:58:40 -0700 (PDT)
X-Received: by 2002:a05:620a:1a17:b0:93e:70cd:e420 with SMTP id af79cd13be357-93ebd2605bdmr3480583685a.5.1792054720249;
        Thu, 15 Oct 2026 01:58:40 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b2037623e4sm2226634a12.1.2026.10.15.01.58.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 01:58:39 -0700 (PDT)
Message-ID: <6230bd88-98cb-42ce-ac07-188a30a8c48d@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 10:58:37 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] dt-bindings: embedded-controller: Add ASUS Zenbook
 A16 EC
To: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261015-topic-asus_ec-v4-0-af6305ffcb10@oss.qualcomm.com>
 <20261015-topic-asus_ec-v4-1-af6305ffcb10@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-topic-asus_ec-v4-1-af6305ffcb10@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BaVNQbt2 c=1 sm=1 tr=0 ts=6ad095c1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=IdPoCcsTyHqTvs3CpEwA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: HRYAXwk4qQDcuGgqUawGorSjGzvKk7oK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNSBTYWx0ZWRfX0+6LNNCYn8B9
 aQpFePhjfqPC2QZTD4YSEhaByBZ5D6jObToTugEiYUaRPKFPqkY8oqhrOfpeIhpnHKruHNQdJwN
 qvPV2XRnI2lwl5w6jAKFjk+ewLQIlJpAzMTi7qY7jb36FvhZkCwb+LN0v8iR1i8EjdSbzVyU57N
 jtX2JmsUMsj+bgKSTbiZCQvdKTo9T2+0wGqaZwDwA84MCFAOH779CvlwaC4cePnpYgEoo2zneVx
 KyI7poZKIE0EMp9vekE1VwKDIwObCHZs1O8IvS61ecTdYyDoct6gn4hbpJ42u1va5ipb1pvNFGq
 r7g3b4Zi2KJc3dZDh+EH5vt7ZDuP0/VHYElXiz47SmfE4jEe4a3snpI0xoKV7TeCYGXSlbNP0hC
 jXbzSE8icf2nORsQuOFWBumV/qrudYrXbPUMckKo6x7m5LTKixoqioZmRo9btPYlsR9KOFZ/pmQ
 FVb7O514iGCXW92d9CQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNSBTYWx0ZWRfX4VqGnPytwqtY
 hD03iZM0ASDK+kzXl8ucm48bulZ4bKNxu/KnEXXTNSZqfIb+FMqshPJdLeSqldAXvzSIGmSyjdu
 uDu1T+HtiAPS3tFayeN9szcwHklZQBo=
X-Proofpoint-ORIG-GUID: HRYAXwk4qQDcuGgqUawGorSjGzvKk7oK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150035

On 10/15/26 10:55 AM, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Some Qualcomm Snapdragon X2 Elite (Extreme)-based ASUS laptops (at
> least the Zenbook A14 and A16) expose a custom, somewhat
> Qualcomm reference-derived EC interface. It allows for fan speed
> reporting, keyboard backlight setting and receiving of a number of
> miscellaneous sideband events.
> 
> Introduce a binding for that class of devices.
> 
> Two separate compatibles are maintained since the two laptops' ECs seem
> to be generally alike, however assuming full compatibility with the
> limited available information does not spark confidence.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---

Forgot to add:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

from https://lore.kernel.org/linux-arm-msm/20260928-miniature-orthodox-ibex-d5b97f@quoll/

Konrad
