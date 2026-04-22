Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4609E35AC04
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 15:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776872622; cv=none; b=GS3qZXCzOd6jMH3kiBWPXBPQmlIgGtMb7mA26eprYGmZ1U376wS/hbjZYmw1Ecu4DGhLx9NewO+A8/aTQHQ86/vIETAicR94ia+G3QwcfJaTzSz7v2zjD1N1mpfay7x0dXM3KX2JNcTOGbYOvgkWofScqhbcphykDuEE3WV4p+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776872622; c=relaxed/simple;
	bh=Ax2QjoBCSP8zytbND0WCxmDoUuiovB4Ezv0zg39ipV4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EKM1N6vh9lnP603HSGxRMZtnXylBJY4zxQeiAlTHmHP7S72g9GQEz+Ffkw5AOUu4823Nyc8bMre999m34sY+lCCHj7Jn40wRplNfxOcWSXSVYx4r4f7Wu52o4RMYhCvYEUtB1CRzGa8tEIsrVz89XJvQ0hQNAXe/h6TXNbmlCik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Svxg3/Wq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A3V3/Rqa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Svxg3/Wq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A3V3/Rqa"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MFLvV6664102
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 15:43:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+77oBS04XiL/gsqw6a/zALDqn3hE4Tj5LuU/BpBUPZs=; b=Svxg3/Wq9+l9tUpV
	aC0N1sxiOUQ69FJ19GSuSf8FkLCTvsruvNv0jxK/p7X4+GAcYTMqc8ArpFMUnAX8
	ozk3ULHO6h6H/OEHarximX8x0qFcXPs8Wi3YS9z1tvyCCX+IoPcYfshBYAkU4IhV
	zWE9NugK2UDRW71VoM9yCjos3vZo7+/8OlwKGpY9B+wR+OHg3bR+9Hc2PAZn5n8H
	T2qI3zi1CSPUzlcWN4QQDDPINht4DL+KUzWFRhI7Fk9tYnn2hBjYR+LDz5Ppew/o
	SaJloRFK4F4zc94LWkAOqVCG0z5UB8K1mkRiCNXRlkU9K4jYbJwW5y7F5semv2Do
	hevHIw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpudgsehg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 15:43:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e5ca8ffe7so61489341cf.2
        for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 08:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776872616; x=1777477416; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+77oBS04XiL/gsqw6a/zALDqn3hE4Tj5LuU/BpBUPZs=;
        b=A3V3/RqatMHESYKft5w6frp4BjbLeMUpakgPtKY0GUFrEx+7eOGraJ7hs3ksulaJCM
         gmlmEaI+v89yI3nhXaJ/7SNhsdy0yuosuJItZVlCthZZLE/Kxd5T+fMoCmjnzxL80gpJ
         Q1mgQtl8bPq6MsLKpNifkaXoxpXBbdRM3k70ovxMeNFcbcOLU7viqLjxepi+OgZpV/h+
         DIYrKT96M/Gw1oiBYTEr8BrkI1nFFrkGLrpnTS1PiMDpNdaJDnA6G6JIidCZ/ZHMU5GW
         dkq0i4NGo6nxO28sXniRrdxHztFYXqotz0PFF/2vcmdII3vpllwo/3rj/KFNPv3pqe0x
         d/7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776872616; x=1777477416;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+77oBS04XiL/gsqw6a/zALDqn3hE4Tj5LuU/BpBUPZs=;
        b=jWMQFRT/BIrNCqF6B9VE8EEcZUS/9MjNdscKYOk59CPxKqNt4OrkVGD3F3ZgX5bj6d
         XYWvCLqE79MnL6AMZwWsmbocLSXAbo6beRRJHpuxDMCrIQvdOS5pcK/wzb/eD/TNZSpO
         x4XHHg+iQZ99fxRfIHEvlFf0gQZmxjCJM4oOMOP+eqiDBN2CdBo/11ZD6ahAR5lWAW5Y
         S3n4AsrCv4SmPAh9/eY/Kgx1hoiM8GruXMGwYtVRDmxQtZ5gXtnT90PIODsJNBC6bK3r
         3VVkgVL767+kebd0uKCHmeSY4aTvFbGLUkyWE0Qa/cVPVoa3eAckBjstedInG7T9kSNu
         iYWw==
X-Forwarded-Encrypted: i=1; AFNElJ8jFgAvfZIWdklmUZ1FXXmWeuekM9S97ldsEdzAHVdrVWljzwHHAaENLgE54judz4WZd0vXGUQHGrwdMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtTrwvltEw+6J7jLr6yUfY9MMM1dw05LDdKhGLXZPdd3j/ULFG
	Zo9H085+m0w9u6WSV/AyaeqIYIaIHj7nNzek/+NbKLkd8U5RjMxjcaNmvHRqp2v0dq4fTWjaVzl
	MnlN+P2VQT7h8739L7ZMWmv7UBcERcXCVsQqRmimcNzwOSWVwYal5P3Y2GRpNLJoPjNsi+DPHYI
	Mg
X-Gm-Gg: AeBDiesSGnInhjukY/WBAcIjngYr4FZMz3yZiujfe61XCyj53UR+yiPLPOAz5V0BJ3E
	O0Ym2LkEUz8naex6/g1msZuHRc7jAcyOJdFGgMHw/gM1arJvj9bqP4AdLHpCtfLuAzYbaAqevMQ
	mQMndrFiETi4IFBHhKRVXERlEJQ9V9hFcDCQ+nVhex5x4gC5PUOs9pviuzgnBfeZHbkSJLhtZwT
	z6UkeQGOnZyeDNE8EXh+GGtyHsXpSE8HsUvou7K7KCjmDp1/nqEr29tHIpqjZ3jhoos4zyWZ0jx
	nDAvnMcpaXEPooWLJ0JNCiJwpgxvcfcIRZDnTWsz+rjJL8UwLTh8xgdZu6B4oXIZenaBk4XcNST
	lmfl83gom7bbsUWyXwhK+gdgspEKd0POK7XNPHYV4jC6w8cPcuPMOk+/SXka6rtmjATpNxxmpP4
	DBNhMjsVlJfUQVB3nnHYQ=
X-Received: by 2002:ac8:7f55:0:b0:50e:defb:9dc2 with SMTP id d75a77b69052e-50edefba0b3mr156546141cf.27.1776872616287;
        Wed, 22 Apr 2026 08:43:36 -0700 (PDT)
X-Received: by 2002:ac8:7f55:0:b0:50e:defb:9dc2 with SMTP id d75a77b69052e-50edefba0b3mr156545681cf.27.1776872615792;
        Wed, 22 Apr 2026 08:43:35 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb78becdsm222848065e9.5.2026.04.22.08.43.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 08:43:34 -0700 (PDT)
Message-ID: <2ba6472b-4071-4576-855f-4e4e774e8375@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 17:43:32 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 07/14] hwmon:: Use non-OF thermal cooling device
 register function
To: Guenter Roeck <linux@roeck-us.net>, rafael@kernel.org
Cc: gaurav.kohli@oss.qualcomm.com, Zhang Rui <rui.zhang@intel.com>,
        Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        Benson Leung <bleung@chromium.org>,
        =?UTF-8?Q?Pali_Roh=C3=A1r?=
 <pali@kernel.org>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Amit Daniel Kachhap <amit.kachhap@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Amit Kucheria
 <amitk@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        "open list:CHROMEOS EC HARDWARE MONITORING" <chrome-platform@lists.linux.dev>
References: <20260419182203.4083985-1-daniel.lezcano@oss.qualcomm.com>
 <20260419182203.4083985-8-daniel.lezcano@oss.qualcomm.com>
 <7e4a008b-74c9-40fa-8fff-ee4fa830e3dd@roeck-us.net>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <7e4a008b-74c9-40fa-8fff-ee4fa830e3dd@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tnBNbfRkDBG4KtMGVpxjcmYsRtLtcbgw
X-Authority-Analysis: v=2.4 cv=c5ibhx9l c=1 sm=1 tr=0 ts=69e8eca9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=_jlGtV7tAAAA:8 a=g8TOPbrVlzZQXTNCp-oA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-GUID: tnBNbfRkDBG4KtMGVpxjcmYsRtLtcbgw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE1MiBTYWx0ZWRfX6SeHPiWlTvRv
 uHgyw14rKfmzw7Ve/LoNi/tN9e6xl+N2YQ2hyq/AtqsoFfNH5nh1boUOpM80OfAqABLmvDgImwv
 cjDDKl1OfIelepTNKyw2YYwhKgcJGncYno6qTwVVN7cn8kSQ4hqYDpW3Y4X93znXPf4BMM43Fgc
 aHClmFWKX+KP+fLLVlu1zB4U/sDsac9kfH8m/WQW9lzl69R5UegqvgtZy2JGggc26RgnaK7mwdT
 wgOLdV88XjrVLVPsQSB6R1SGAlRNOxBPPycYNrkTqwutNe3qxLfCYdx88OLYW5xEHy4Ledkxg14
 ZRlrC2ZbXzDNBcgxdqP9yAejDDck2tj19SR1WbS8vek+7lZV4XyiCyERPmPD9XF9+50ltKiJL8O
 sdezcHJiX4OLoApK8uiW9BkO2rnON1s4tJBi8eNnF7XnRf1J+q7/zCxIAc569DQpl7ULuBA2DOP
 PiV2puhLGxeWBzI8MdA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220152

On 4/22/26 13:59, Guenter Roeck wrote:
> On 4/19/26 11:21, Daniel Lezcano wrote:
>> Make HWMON drivers which are not based on device tree to use the
>> corresponding non-OF functions.
>>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> 
> Acked-by: Guenter Roeck <linux@roeck-us.net>

Thanks for the review
