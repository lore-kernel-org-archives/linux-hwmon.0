Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9BB526AB8
	for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 13:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790688034; cv=none; b=a1qmnKjjzUgfFfNeR5U2SMNMSAd0pq04Bk2ACvvekkAlXsTO20wXOe9olRpqhH47h9gXEHRXgaLmEBlLYN5UHa9ONk8L3YBXdR5ARcqXOa00bckw9rUIgCbsNL/xSSkqqtX9y0bJjOEzE4P4RallXI8iwt+o4ypSIPtjXqfaLyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790688034; c=relaxed/simple;
	bh=32Y3KM5bCP1SDuaXQ/j9zM68Tajy2ksHRzCJwpZJBxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RQnpvfEexXyi+ZbzB8dcH9eepI4nHEOreqGdVazPT2sLpO5Td7szJcsExpw6XaRfKopmc5tEnHFXFnYI7SD7SZkPDkjoN4AOaHCzBB82xtcKQ9R56BoKcb0YmkmjAJc4H981TLbeCycxBgYcnLeCQRyrqzGo8sfhUNY65FI1hww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cp/W5y/o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OKEDox8q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cp/W5y/o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OKEDox8q"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqiru611654
	for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 13:20:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2T5RkWVrZxsjtjTmZsWjGyBA
	n0522HCwfBHwVcNib0U=; b=Cp/W5y/o/+r6C9nXhvcXSn/xELYr389Kp79ZmxpG
	2NuxYC2uWb3p4qnbwPzT9BaoPfJI6QJ86QPZUdWbHY8+CXI9EOBx0DosSa3FFGPp
	MCogYlNViyzj8W2bhLfan3joyFqF+yFUoISr/VUpl/RGAi0Y4RtQQJNADArUvzhy
	dq/1yoUcTbw5wCW3wuV20yx5ur0F1GSUTkB8QC0Iug4Q3tVQpt2J341kSeiGUEl0
	13+PVopSgwLyNDyRwv4f5Oku8S7emz+aoURwVpSzUl7kZ1UCw0e8guoUjHkhuxLx
	q6RtxJlTFRkezp25r7t/eeQWMkgtpPy5BcrJlb/XnLUa0Q==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h00s4u8b9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 13:20:30 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7b3cd4ce08fso497385137.2
        for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 06:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790688030; x=1791292830; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2T5RkWVrZxsjtjTmZsWjGyBAn0522HCwfBHwVcNib0U=;
        b=OKEDox8qZg5tg9A7fh0JkVcnYzpFldCLP27Cc6sxT7tByu5nQZouYHGYrGXm8IBdei
         Sr4B6UvrlOprIzI77lJ2pipvDX0fq2ElkCY6gun4VEwJvXjPeNF6gMr7ofbWYQsUUUft
         V4BX6hgTmTfE5MtZjUywabDNQceFILuBfs1TmNe07nhUpZfa9X8FXOJTT3lJ0vD62vLT
         /fKCT3Hn8+6tXSxGjaxFuaBEYIRNgUx1qifMd4Kn7lKiP7zDTDBhjVkydK+uimPFqsz9
         YdBNpGqlDTVjihXoQD+44EbNncRa1+uvkJLY5NLlhv0HVkNh6vI40AKmlVK8So/QX4nD
         bjbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790688030; x=1791292830;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2T5RkWVrZxsjtjTmZsWjGyBAn0522HCwfBHwVcNib0U=;
        b=D8v3l/HNmSkrs+mbRKwy0TlKAxfnAIbB6gQSa20SBo8QV3ntsyxFxQ7o/chaSYbN4o
         6KQWJ8DfEJyGNStvM94yjXXhRiuX/x9q6WQUEOAjWezyEXLv8CZURllrO+iAAVNfqpYb
         5n4o7X7tNCkBrKMkM3po3fsF78LqzK4wtsNmNxRCQLKoC9RNKLdtLxfSuybtsjvzae4n
         HjEmOe6ac15jJAHa311OoN4vVR6Ay2h9ji/10MeIocBD1vMxLp7jEggP9gGEY/Dx15Uj
         0D7dwDlV8v1qrxARKOLD+/ijQwUK4pyoVYD82BgfILmIV0+y+fUzOvVo8LfkIvB/jnBV
         VyHw==
X-Forwarded-Encrypted: i=1; AKwUvBxi2oJ1YJPQLNHai0ESCtgqu2nHRp7fkSvBrjf6UAgqNu9ppGTbzhviNRo/EFmp3TV5ZQv2nvxe1BAkrg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKWlNVdym0oz4FUWXK1UkKa+qr0WgKfUmfXpZowRdg6JxInYzzi
	x3rgsjOWJpTR3n7ms692yRySZcpWI8mJapWeeSwyE0lEmM2NqJgaEYtTI1XHchF08IkOgT1dvK4
	rf2pIClFD/zX+XhBSkkeNDB+kE4lzWBfVcRC1exkWWmH+qrkAMqHPS71oJEOYqMbyCw==
X-Gm-Gg: AYBFou3VcP2x6ekhNpms1EdTftEDV4lfwcvCyTqrAPWzvBCmbFdEzk2/3bC5PGqhmQd
	q3dqBJ2QTHk65oc02MG7Yy4dX9il41Gxt+M281LrHpMhHf1hHsC6jvwPLmLjQL91gY89K0zdcBV
	05fQVzYAQswAp/YSAIBipGSdOcWZezGtiHM2ghliWkVrU8UEkLp2yV2mT75wfBFKHEQ7xIaPj2t
	rEu6jRL91ROtV28I+kQLNHPH7XScxnUseBzFfXHa+o/4twiXMcZgFo4vLUuzprmbj5OG7RDASUD
	zjdfzYx+m3ZIdEdj9vKK8XuF5n+i5rF3yO6hsu5qjb5XntJVc+nXEZtpJ+MsJySHN/EE3cuGJRK
	rNuaNWgE3R3PptfI=
X-Received: by 2002:a05:6102:4186:b0:7b5:7cd5:2a1b with SMTP id ada2fe7eead31-7b57cd52fccmr1747283137.10.1790688029370;
        Tue, 29 Sep 2026 06:20:29 -0700 (PDT)
X-Received: by 2002:a05:6102:4186:b0:7b5:7cd5:2a1b with SMTP id ada2fe7eead31-7b57cd52fccmr1747265137.10.1790688028694;
        Tue, 29 Sep 2026 06:20:28 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.162.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfec770sm82731695e9.8.2026.09.29.06.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:20:28 -0700 (PDT)
Date: Tue, 29 Sep 2026 16:20:26 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: Re: [PATCH v3 08/12] arm64: dts: qcom: pm8550: Enable BCL sensor node
Message-ID: <kab7u3u7mtadzvnmknprujtjszdryurwjbwqgyr3aovzobumtu@y43okjkpzupz>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
 <20260929-qcom-bcl-hwmon-v3-8-f5ca00889cf7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-8-f5ca00889cf7@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MyBTYWx0ZWRfX6BO08ppkyWia
 /P9jxIRvy9ZIbL+sFcfqoPgjF5MRaLzAFZcjjcR9DWrM0aC7TjNRdMXDZ01oMvyogJFoklVAZ+A
 xfbkP9HOkdVLDyLLkaOazMI/PNfR9gA=
X-Authority-Analysis: v=2.4 cv=ALbfqNVA c=1 sm=1 tr=0 ts=6abbbb1e cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=6/JeGS87fU6CufIuUkUOiA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=X6Y4kDKz15hUnpVYhMEA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MyBTYWx0ZWRfX1QXfTZSe0drv
 2yKgZXJ8VthXBCwL+mhHLM3AQKcfgYfnJGJEqdwvgOPPFhNy0lSg4vTM1V7qG2J7Ict7WgTDvLN
 z9mLM1fGGKuEGNQ9mKflC0ONp7ifh7OH87DecyJSDfyigiwsLBZDn0mV9fq2+Q3GNQPjtnghf0l
 1vN9ym5r+jINzauJcFd3W37/Ju2H26dtBxfDnmrGCA+6fNin2/48YSsqPyw11ecab62htIy2/Sh
 H6zDUyHHLqINg4IqnrE3iSnafto805SMuOwQe3u1tVd/yqnlipgK37QvIAEQyWiDU0xt9Ruc78y
 7du1/4YhmhoHWZA0CcVkAoxCCWxWb0sTwyiusz++KJL+1OWxIbYvoh3vGdnwzNIf1FLBzEW08AA
 ZZhuUF9Ic1RezpJaRmsMw47Se9ovbrcqVwY1NwreWdrhfLhV/9hFDnbhA3YROo2Eul0dbSY73u2
 ck1Ld+wsbznSClAPZCg==
X-Proofpoint-GUID: lySYXC2oh6T46MSZPo6hO031osY8tWxy
X-Proofpoint-ORIG-GUID: lySYXC2oh6T46MSZPo6hO031osY8tWxy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290053

On 26-09-29 18:39:40, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for pm8550
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
