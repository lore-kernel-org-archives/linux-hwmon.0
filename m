Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6813DB983
	for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 11:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792410023; cv=none; b=B/SZKpBoFaOyRE2h3b6ZShnEQg2Bf/CvAuLT52pSzI4ohFBjgPxyyD06YRgD3QDFTN2PcsdKiDoYyHlqkpfGigEFoss6R5Udii5BwQUDPcfH4tlJfsIUUly39r7LVGxsvaIBtoxihYHNGuWjvvb2eFg8W1JldGcIFtPBcctSA1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792410023; c=relaxed/simple;
	bh=zNa6hjnbJsZirNp2D6itt1WLH37BdWd7BIdoXDU6qOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hJL7vPLqz4BQlcgqy+1EBw9Fi3llDVnVYBeKKcugVyKkl+qpAOMlubCHH15I9s8A/2tjKU5FRC8WCVhTdEB1mNEOOE5cEwEdh4EksZQespfcWVzjXOe7jLomPQVCdilVF9XM/NPPumrgwHcrQcOGBlo1MyFVJi2X8TeG6d/1nUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b0qske6Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cC3k5TOy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b0qske6Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cC3k5TOy"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8P7wo1896627
	for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 11:40:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IqIT7unUNeDVbUGIwzQRnFuw
	+MAaKeTUmeCgf8MNO6I=; b=b0qske6YXg+7km4y82nPrdnSjk/9jGB8dE2zAfS2
	aLdB2rwbp9/1KnLBds4r2l+TrTfOr0U2KAQr2xmzeLUMdUyF2/jWc/jzV2W/Kzk1
	MtUZqw//2uZv88Ml9ugxhsStIbmxF22YsG21P7WFiHCPcXOx5sKcKQgO+9SZqewA
	Nn9U5MxRg+2/s3jR73PD5JiMN7wGp5myf7+uj7UvOlcx+8Jine2wHPRi1OIIzv5o
	HDwZfAfu8RHnZTzOeU/78hxlJnQnc9tUb76eQE7DRNM3yaeO6PY6HP03SIfEdORN
	Z0W+8/fHeQ3IvKkWvCw1PCqKIIktBR/PKTyWevAi2Ib5rg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdbvr9nv2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 11:40:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f33438950so462451085a.1
        for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 04:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792410021; x=1793014821; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IqIT7unUNeDVbUGIwzQRnFuw+MAaKeTUmeCgf8MNO6I=;
        b=cC3k5TOyM5dcAip93qkeqyyqzx90FfPf8KQ8MdrOwwRAG/hCGdGHfvzZgbMHfNM993
         qzWPRlAZT/AKRHeIdYHOqpKBvOCiNxJbi1thbk+xJBBKHNdAQwoQG2BgtryyaNt3/MGR
         DylStc7srKfPAYHPrFPa3NFyUdB4Yodpleu6K3fewcTWcfvTsgRpJN+JN3u4a7Q9NZ4u
         spa8Yf6wM4FYMKOFS4s84LXedLMkU96aYXZd2e4clxBErVVHioH1iOeAVqQyGVixcPDb
         I0+FM/4TYrlxihKY8Vxikf6fqnup7ra8mmZzbtr6rMihbDA+7pa6dU3AFuILpYhkWFgt
         gMAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792410021; x=1793014821;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IqIT7unUNeDVbUGIwzQRnFuw+MAaKeTUmeCgf8MNO6I=;
        b=RgHlkBEaPgJGKrwhE2/byMPDAoQ4txMNlO+xVJe46Hlf8vh7gG7l3yNShd8LLkpNd6
         2oRty4TCjSUswwFApOYp2HyTu3JhIdlSo+4BijgPwo7pkf8BzpnTfFaqVe5LToGxlCGq
         ON/q0Srehnk9/9xfl48Nmmzko04TTEWNQ5vmZ1fSzVAoK2baspnZ03NU5zVLy7EOd+b2
         k4SJTQgKcTVamgba7tsc22IhY/abK8AGVWXkLS4VqmV3cidlR6AwHzSw1efTOL/ohgow
         pEA9QP1c2WbAO9gIGkiZz9EyXbAHQ36UkW6ZIYScxR6vus//CdNRjvsHosllHlLAi9Rq
         hNdQ==
X-Forwarded-Encrypted: i=1; AKwUvByHcv6fnaBJTi34Hx6pGnPWhKTBVPE1gfqCowj1H3if5/+zOGeuuW41g1TwE8JsS8ZzA5ACupCZhC5J6w==@vger.kernel.org
X-Gm-Message-State: AFq9FYKawKMB/DHddVMgYqlFvlPvWm2fs1nR6kjHRIJonItcqzJM9u0v
	0lPlspuOuzWusyFhzCUUEbaRJwThZZLNcRd1A4pyiIv9EgIPu71vChTm/AGQXw6OZHjdmlmJGOg
	4TCzGyeNp4MCJMsGDj+9zyDENt4EFRsuaXXLJbGoLB0zM8JqKTI9ELcNrJvWcVbBHMQ==
X-Gm-Gg: AYBFou2ujG3AZCrLwBDFY2DWYNoBSbw8l695eotUJL+86r+zY3tc1C7HCpLTB+5CwZK
	BOGY/9VAu1l7mK0DhuGU3sevEPm51a1tY9SlOGkZEaPNPqjtcPmmKHeUXOhm39DjJLAqsDZfGtT
	fThyByyuSTAUtBYsdeNxFr1vfKSZqpx0hgl80fWuUH9RBitEtSrB2GOaw7G9mUeXG94bu/PsaoG
	YrY/yXFfehd58swUrYnjUpZevhEkgbZjcjIW4qWY1LFks119C6XKw39rFWbintzHFODpcKgA2Lb
	IrFINH/mTKkho0lxGBkxnkIR4FjdjazDRKSRMr5gFq3qyI2NMopss5RIMzlycYazQI2lmqtLga6
	0G2oYa32VfHKlIk9C
X-Received: by 2002:a05:620a:258d:b0:939:6dea:374d with SMTP id af79cd13be357-93f29d813camr1251144585a.49.1792410019022;
        Mon, 19 Oct 2026 04:40:19 -0700 (PDT)
X-Received: by 2002:a05:620a:258d:b0:939:6dea:374d with SMTP id af79cd13be357-93f29d813camr1251139485a.49.1792410018424;
        Mon, 19 Oct 2026 04:40:18 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8a81587sm519633865e9.1.2026.10.19.04.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:40:17 -0700 (PDT)
Date: Mon, 19 Oct 2026 14:40:15 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: glymur-zenbook-a14: Add
 Embedded Controller
Message-ID: <44vpjtmnwg7wtp6xsqgl54rbpos27fndfru7pmudfvzweyl3zo@r7dxlf74klfl>
References: <20261015-topic-asus_ec-v4-0-af6305ffcb10@oss.qualcomm.com>
 <20261015-topic-asus_ec-v4-4-af6305ffcb10@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015-topic-asus_ec-v4-4-af6305ffcb10@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NiBTYWx0ZWRfXyNuAmSyPnc39
 8oZlDeyhS/l1tEEsn++KK1wgGORzhj7FslRrauyi52mhJDRClnq2OJk56st+x0mwCvP+MXOzFys
 1klx9dYRrZKJcuFuaXWe1Mm9FYqiOERD/E5BE9qwKoSaL7Pn+NYh0SSewtEq+rgu49YOPhmwGOU
 i6pw8ytrQHF570DC8yyfGn22kfWRIalCHWlSpPfplWPrZA41bdQgo+Hz1DOiXDk4b22g7Jhp6oU
 o07kUt/VH6dClGuHUNUr6SMqcH6ynKvuhV5IV3+b0Pe0C66dy61g0G+baRyb5sWvgrPLci4LEK1
 RQl6Ci2WPtgtpa8mjwtophB/cvB0O46BZVLmBQ79mNSDNcOjtPfa7iWzE5z9pnR2mTDXCBsIfbi
 LCYLJN7+vwr125JjzbFp8GugWGKfv1/H+CUtNeOFoYyoxYifIwGXwcuM9IuMxC9P1I/jiHloLzo
 Rs+nbvWgiU46gb8kF7Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NiBTYWx0ZWRfX7Ap0GWv2ELHx
 K9fp3IlYC6vWQQhFJDMzEj7E4+4oIh5bisD0f5rn9UkGIBxFcM+OF2rFRIUcgKuTjv3pdzPG4Rd
 gTqvFlpm1vcHMaY/UQ/52yagqhI16+c=
X-Proofpoint-GUID: yzaSlw6RsTyaFfJa30do7Pi8yFkbQY9T
X-Authority-Analysis: v=2.4 cv=K/+3jCWI c=1 sm=1 tr=0 ts=6ad601a5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=-FifcBtKAQNI-ioUATQA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: yzaSlw6RsTyaFfJa30do7Pi8yFkbQY9T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190046

On 26-10-15 10:55:32, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The Glymur-based Zenbook A14 features an Embedded Controller running
> custom ASUS firmware (which is loosely based on the reference Qualcomm
> Hamoa EC one with a lot of modifications). It provides keyboard
> backlight control, additional temperature sensor readouts, fan speed
> monitoring and a number of miscellaneous functions.
> 
> Describe it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
