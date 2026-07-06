Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4B03D811C
	for <linux-hwmon@vger.kernel.org>; Mon,  6 Jul 2026 19:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783366182; cv=none; b=ncuuH3U8kvzhdz3e9mO0hasTBWIiz1Uxdsa3SP37iDqoRC3hV59MVCwGSrjabNVG86Ohd6pXUwhKQ3XWCX31NZkL8YSJavxBjWkYH1ZW5H4xj7lbqDswcFw6BR0UAbXnixNLoJtQ8MW+nNCSHFsGb1Vs2MeYu/AZ/FrMT2kz9oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783366182; c=relaxed/simple;
	bh=w3L9gA3qWCSJOJycfuLUhr74UkEspHCqcITKn7/B1Yk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VK/PIb76d+Rw54IC5zyjY2N2psSYvdOZP8JzH5WifRcXMgdsZgRMeQ954a6/93cmpDu6lsGdlMaRO7YTfrtmRhT/qmqs34nyVzVkCbwTvPK2dWvC3xXX1MbyeOzX86GIincvQFHZTRC7zlPq3S00DKyndYQdot1w1PafwwveYsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OA23AkmY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GqVM1OQR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OA23AkmY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GqVM1OQR"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFJmi982778
	for <linux-hwmon@vger.kernel.org>; Mon, 6 Jul 2026 19:29:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1MNHaWIk4PBs4MJ6Wrebqp4A4AMrSu5e1jkD6u1Sr/0=; b=OA23AkmY3caOk9jB
	dNUnlz0tTKUiOmhQT/60BasqZkYmtET8Ptz2FHtHF65SEQNdaHEKbUA7U91OLXLH
	h0IaflwetgJaohLkZydtXvrbHM0m5kLLhYJ/fHuMbIHpSZzDFhW9U17ND/8p3aeI
	tRdo0BCQ2mNQo/OFjrZjokhSiAx+J7MQfQ0cQnYPOzW/VQpDv1dQuCntiiXkOb/B
	lM003tlj7LVU//H9BsGG66yxrbLqwf4J7PaFyLGzCuJDGyB3erUuiQ5g5x/qrngf
	84FeJTr5NnBY7e5yxwajq2xT0gRruMaOHlu74kIz206u/aYC4ozBwquujD79mZEw
	HvPzrA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89qpjnkf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Mon, 06 Jul 2026 19:29:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e52306621so252585485a.1
        for <linux-hwmon@vger.kernel.org>; Mon, 06 Jul 2026 12:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783366180; x=1783970980; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1MNHaWIk4PBs4MJ6Wrebqp4A4AMrSu5e1jkD6u1Sr/0=;
        b=GqVM1OQRJsOYMdAogCSoJO1QulgaMxcw+vSCUKJjyLA1syVVuXTvZwrSt4029aWH2C
         vHbkTvoDTklIwStFKxJI9kVpxsJWB1gU7e5kmCkcZXewqMZeYNzBg7p3p9siqOETOMUZ
         iBQISOX/ryMxSugfwuOUeFm654OOoq/sO5g+KfYeUcCfBXZU4CtK0LGRUiNeGeyr17JH
         mxsFNVzpjkJ0eKpaMMmUyjgevCWpOlG+77mILthKk1c2YRdpbwXqYHtupQ4QgqCQyR59
         MXwHTbWtIbtMsuTijykZ5yEKzWKVQ9Yd8PPtO5qahi7052qw7M46WZ0WBl6cE3+a5uiN
         q7BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783366180; x=1783970980;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1MNHaWIk4PBs4MJ6Wrebqp4A4AMrSu5e1jkD6u1Sr/0=;
        b=E+W5hclLYSgnkRE56KlrxIXuR4phNzAqkY6JfSq5f+DfPVXxFqs7NsPMkXK33P7iR3
         tLwlgvpsAIDOfO7ElgsYNltLtvYMeaPYeaEZTupBGF+utKYqa6XleZwX+WxMnj0UhImU
         hAf981XCX6sNqu6xvRVSeQBcco2dAD9Y2f4qd6lGMFcjfiJnkU3hvfVlhnOiWDkURPqb
         6xp0x7z8D4pJhwBwUDIpYBPnDoqmDibxC1ZkIxdoqtdHbH62tn5CWiIhmWGa7iyWTA8M
         a64LfSXNqavceSdi9lxNAdTobrf+7+MZ0o9FB9rRhsLi2huTKBCsQFRZxE/7kW6UaAQB
         BB4w==
X-Forwarded-Encrypted: i=1; AHgh+RpDeieSqb4rOyowZihf1Gc/5pEcL0/gGzy3/fJe6i+uFmaVa53fEkk1GlUYeG7g4W+Q1sV/aUgIVfUgTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCvw9YKOxuN3DIDwoYm5SZrWYI+r5os6dKsly4ZAIfKxE5qQ/m
	zp8kLFcc9t4TjDIZa5DxGcFFMAFf8O4wNyi1dTyRr6ruIyQ9oO2e/B8liODKL2/SI4UXQnK4B0u
	3MbcuDv+eHyOV/RP+v5C8kVhLuORfbai6bY8mGdikdeNvQGUvMVy7peS01PfyWmz/jg==
X-Gm-Gg: AfdE7clA7LVxXSqwcz85RGSnh1w3H1VHDuuoYjE6bqpgPz0qmh1goIazKnAjewki2ou
	SyEwN7odfL/Hkv5HaDTK97X3HVKTEWc8iLpCjqiPXTofUqHE8t+hQ3p5lSA+NZOzvGN45cdR3PP
	WeoBWOaF+wB21N6DIAwAG+dtrkcbRXzDbwxnGe+6srTKbBv1KrTtNs1/EB1o5u4dTFfJJLCtTWK
	G7xhXJEH6vBus50zqWfUcGHSQxnjpzjJ1UIf9JE2/NRXTd/3Zpt5k3zkmACoK0aoZ2YsJ8qn7DG
	KWPW9FLik4IydMVL/A3gpBPwZqslBonWF0/zYSFSCt8iid8xUtD86hPwGe/+D+bWSMe9B8DMJJh
	IQudxmhuzi0hHFFuxzgZv1kf8SdvuWWjyKSGVa6aft0Xw/M+GkrbQPow3Yc8/tLv2CqwjjSwUvb
	Zb+Se80vgpAq8JGv2XYV+jwX2U
X-Received: by 2002:a05:620a:4412:b0:92b:3720:bc59 with SMTP id af79cd13be357-92ebb4f9c01mr259961585a.28.1783366179307;
        Mon, 06 Jul 2026 12:29:39 -0700 (PDT)
X-Received: by 2002:a05:620a:4412:b0:92b:3720:bc59 with SMTP id af79cd13be357-92ebb4f9c01mr259956885a.28.1783366178684;
        Mon, 06 Jul 2026 12:29:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bb685sm3095513e87.46.2026.07.06.12.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 12:29:37 -0700 (PDT)
Date: Mon, 6 Jul 2026 22:29:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        neil.armstrong@linaro.org, gaurav.kohli@oss.qualcomm.com,
        manaf.pallikunhi@oss.qualcomm.com, priyansh.jain@oss.qualcomm.com
Subject: Re: [PATCH v5 2/3] platform: arm64: lenovo-thinkpad-t14s-ec: Add
 hwmon support for temperatures
Message-ID: <qfqoes52fjrd5ivq2tqfnua23lkm4qgyrvalik35qb4u2njmiu@5e5wugwoxkzb>
References: <20260706184648.35613-1-daniel.lezcano@oss.qualcomm.com>
 <20260706184648.35613-3-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260706184648.35613-3-daniel.lezcano@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=c6qbhx9l c=1 sm=1 tr=0 ts=6a4c0224 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=QyXUC8HyAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=n5oyEeUQHuXu7Mk2C9cA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=zZCYzV9kfG8A:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: iRK3LrRfOEoId0mJJ9skpGJRHb54FS6Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE5NyBTYWx0ZWRfX0oNw96MJ222x
 W2U5cEGuuYqy4lJ8u0y1AT4XVeVeSYKuHU55nqBwvpPuS4cpUsQPBvkSVAIDnaBku47wuVCzzfb
 3uwtxUbKSQt2mdHTSeM5gdcFU0hWigWRcy77ypjCCtNT8tQtZhZheFBPHUHTE4vkrlE+8i5cfqz
 9FM6sfApCagP5iB3krHlOJpPzz4QXvcR7UXBXX6nr+aIEoUma/pzsk8G2HgB6Y+IqIMiLv5opRQ
 xvgzLHy16BbM3ga7M/ld+xziOZLsQKbWoZiMi9v0Hv1A3uwwkGrr5jaLvC0oN2LhgIgJyqvmYba
 JZNa6KxT64yNj19X+Ock1fAVxjyW0jxoyz4GXOnZjkghxJAKnOqmSJN4+I4gIW2yKGXWPAQ95L8
 OG1oRGLRMxKwckDorNcKl3+U+ynOIdbH5v+9hKWoeZ2npt4TYyNrI4eAbPTvKrM38nq/ryzDxoH
 2Cbog22htttUCmKPfww==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE5NyBTYWx0ZWRfX4WwiRyQuWeL3
 irTct35gkvdagWpug3ntQ/6WrDDleoGTAR5mRPBN+IDR1vR2ym1dva4wHkE20+VJDp737nxFwHv
 9JB2cMChLLyW18rcgAshxtGjC0L5uxA=
X-Proofpoint-GUID: iRK3LrRfOEoId0mJJ9skpGJRHb54FS6Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060197

On Mon, Jul 06, 2026 at 08:46:47PM +0200, Daniel Lezcano wrote:
> Expose the Lenovo ThinkPad T14s EC environmental sensors through
> the hwmon subsystem.
> 
> The driver now registers a hwmon device providing access to six EC
> temperature sensors corresponding to the SoC, keyboard area, base
> cover, PMIC/charging circuitry, QTM module and SSD. Sensor labels
> are exported to allow user space to identify each measurement.
> 
> This allows standard monitoring tools such as lm-sensors to report
> platform temperatures.
> 
> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on T14s OLED
> Signed-off-by: Daniel Lezcano daniel.lezcano@oss.qualcomm.com
> ---
>  drivers/platform/arm64/Kconfig                |   1 +
>  drivers/platform/arm64/lenovo-thinkpad-t14s.c | 131 ++++++++++++++++++
>  2 files changed, 132 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
