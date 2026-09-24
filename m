Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEEB424D7C
	for <linux-hwmon@vger.kernel.org>; Thu, 24 Sep 2026 11:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790249601; cv=none; b=F5bnpJxEDHJ4XGxW+w5mC90V9+zGI4TMSmgm71O1Fpk8BA2K4H15SWX5C3F3H2/89VOtYxtO/6G3tpUX/J47wIs/n2VPaHJ7FEAl+faFkTzVDULM60CTv9UBAVpRp72MLnZInCUTEYdjYTCkncEAogYirZExoENDqT9AyPn7UxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790249601; c=relaxed/simple;
	bh=wCnUXCK0WZO4NnQlqvBDKz+4inN5YfMZjMTHZjG1y3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dSUfKmXKrfdWAB4+jNkDE/veI/a0Du7APjEl7NcCw+W7oATD9KjET5tCIUkBNqU4SfpKDVnT/mPkZusDhqBVaykQsQNPgBvE3Lsb1Em+q3kGD2xQ4M7Sbi5Tr7ZIX9PSb8pZruzdhLc+mnHlQODeW8K47z5o9KW/Z5GC6Xp4hG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IsRFmiJj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MdltRVPw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IsRFmiJj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MdltRVPw"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA3XmA538609
	for <linux-hwmon@vger.kernel.org>; Thu, 24 Sep 2026 11:33:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XkseKV+yt4Jy0qKqCZ9EMQvZ
	YwHKUGqrc30BMVfNwi4=; b=IsRFmiJj/bR+E/pi+HBhTPjZtcPG4aSH3W7uzcoP
	1AkmcbvhlkMXrU9Kay6CwMrAeFLak4U+y2UmuPio/SjPY4xngSZGD2+gxEyJemzI
	IJxDUUb0pg97yRRgsPOjhikSH6Onvg4BfV3KHlv/tWZ3OqsFS6g2/uCv1bjjFT+D
	AySxXmdD/nMnXdNkPO0EmCRLd3I3Obagxa2F8Q5ZwOexqslBBci0YU368qbxuLni
	eAzXLAbkdXpUX5F/D7wrCpJj8OHHBajtIXEKMvz+Kl4baXMYgNhzlkbh8Pwc3e5w
	O72MS1DkdNb345i/I79xp9uh/sw8jNmrTNeSATwqQhrjyg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1sc8au0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Thu, 24 Sep 2026 11:33:16 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-78f2fe53829so1918147137.2
        for <linux-hwmon@vger.kernel.org>; Thu, 24 Sep 2026 04:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790249596; x=1790854396; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XkseKV+yt4Jy0qKqCZ9EMQvZYwHKUGqrc30BMVfNwi4=;
        b=MdltRVPwKpi7SrLkC1Vp15c3p5Qb5PXhxlSqBq/JYWwkN1xWaj7fCnucm75huW8aDD
         QUvkn9hJjx+mxOPBGlO4Z+EwzVGcmmR3e/9234lMWe7gcVTrS8XyypcJaChAjKyehcg8
         RA3+H+2B60dCEC1suMzQ4H+x5zb+gMTfnyaHD0+CO5S+ApxuM0iYq3w1H2LqLM0jA15A
         LwkMRzEeSR8/Zx06pejKA8T94jXH8Bb5+wAquR+wK1R11rxCb9nz61BjV3w0mt5pKufQ
         kW+vhHC9yjIeNRGw6TXE8siXrbaH02knIGzR0f9bCmSq1jADSanmZiQtPsl8NWU3ZckT
         SPFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790249596; x=1790854396;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XkseKV+yt4Jy0qKqCZ9EMQvZYwHKUGqrc30BMVfNwi4=;
        b=JNLbdtUktKvAGQNOoPcJi3sgMAcS2P+8pmajUjX4JEhLawCk3M73wOUsvhReAuieP2
         zf0vN4di2tZ6b6k6BvgRBGQliwKsoI1tXr2EKLSXx9GIIYRutQzjxXBNuCO0QsdJyDld
         k1QWtr4BRDwB58+dgP7vNFgQRPFFVbu8pMcyJj9zm+aEYNCYOJS0KLArgILwW6Myx15G
         u4DFmLfyD349ktBk2w9brYP3pcBUNH+a+z3x1ZHCBY5CtOuaWkqiyvfHovXibyyzqzQ4
         E7mvtuZsTcSXrAhwTprn7vmcAatcE9qq3K4NcUH+seK0AjwcchT+fsWGfoqiMhtXp7dD
         2JMQ==
X-Forwarded-Encrypted: i=1; AKwUvBzERpd3M3wG6aPlDM1AYKHaCp/Qc/Pg6TVUHK5+KSX6sHrhgUVIVnswwIUgEwLaBUmS5LNTy3u25qkGEA==@vger.kernel.org
X-Gm-Message-State: AFuF++lUy4o/y4WyvNOb6XoKwG0vvp3nB7SwW6E8irucGP4DJI6SEJKJ
	TvPryfkrphE0q6bmYuovxhxu7RdIjwVTdZz6Vjui0L5SzHMy+9P3amXyhTuHUXHDaTglmBm5NO6
	EoZ6wF7TEGy8Kffb2kdLaIZXVloNdLWa+w7KPuj7tpOsK8N6DTqMAnE7nbfTYuDdwDQ==
X-Gm-Gg: AYBFou2ctBj4htgvhNWfpczmFvbwK6ImRNvj9vLzr5zGUSt9wqXv95pgrEkqMp48xjO
	6H+Yk+/SyaW9rph++S4Uw2TxTq3hRFeOV64cEFsfR+AnESIAQeujHlFiYB/CqlSqIrU3FzL+l95
	vfBrGBPmLQh+ZZ2kD/QZhFfhLmuesg0WhnKm2+mB37M6mARr1NL21M6fq8bOAtsFowtRLZ9Kwye
	IC+SOmGeYvl4ZV7N/K3iVpwOO4WFkn3N5TFfpV9gjhE0ey+NZh92fM0PFg+45YaiHPeEsTEuNbt
	R321ktjaNKYAHIanvdNC1AHSc2GH8A6jI7YpNdHTCHxabq0ihgkBHDdvnYdjMkxIDN+1sk/p8JG
	zSY/ceu+5LtqJqBQ=
X-Received: by 2002:a05:6102:1489:b0:7a1:f7e2:aae2 with SMTP id ada2fe7eead31-7af1e6f380emr1107590137.20.1790249595765;
        Thu, 24 Sep 2026 04:33:15 -0700 (PDT)
X-Received: by 2002:a05:6102:1489:b0:7a1:f7e2:aae2 with SMTP id ada2fe7eead31-7af1e6f380emr1107577137.20.1790249595157;
        Thu, 24 Sep 2026 04:33:15 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48868889130sm13762102f8f.37.2026.09.24.04.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 04:33:14 -0700 (PDT)
Date: Thu, 24 Sep 2026 14:33:12 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: glymur-zenbook-a16: Add
 Embedded Controller
Message-ID: <mkqgu53cyajjjbrvwyqv3vukag643g7x5ypjhzh5vomrd3lsvk@yq4oely74xw6>
References: <20260922-topic-asus_ec-v2-0-0bd923d1b853@oss.qualcomm.com>
 <20260922-topic-asus_ec-v2-3-0bd923d1b853@oss.qualcomm.com>
 <uv52rxc6llmlas45mejbeeriryiozh3v2f2itbvfzo4f2sgazm@ly37763jkftd>
 <8c9777c5-f323-406d-a996-17bd1a5b8946@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c9777c5-f323-406d-a996-17bd1a5b8946@oss.qualcomm.com>
X-Proofpoint-GUID: 51ChTPEqE138m0EfgNmMi5T6gXO8ARjO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NyBTYWx0ZWRfX7QJ4SN5AyEsF
 Wzn7dgdX9u5gBvgmonXFVdrI4bP70YjxM/bHwBqkSY2Hu0wvbzVATtHSSjcgFB7+u0QomIYMAiw
 vpZxW62UGigcAEXsMfCSI+qXADrXXZY/hN3Bok6InInQ16FZztWkqgImAyzGDxC9+vrZK10skJy
 cSfvBMHNuWFebmjjFvTvHFNzAOeBzZqGVW/DjDcwt0CUKIbxPVj1JRpCrDnm68mtYOcGxLdCdF7
 uwjkWL7cLoQQZl2bE1Q9tzkBp2fr8DkX3UPboqcLjyT2vV23aS/shM3EJ79zV6/zTZCmJfDjc+9
 pThOqEQxUYX0w271qA1idu1GLkv/jlkSWCM+xQWFXSiuUU5I2P1aGTU59cdAwoD/sKeOZx6wdlB
 j4pTZjuUMoWzCZYJrCUQq+r8AYlaGGRkt7T0g4ykyYCJ4ufnOka8DM09kVhbh+gjEFEOwJuXnyx
 uprSlW7Q6WQEFPWf7BA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NyBTYWx0ZWRfX2GpwIvqgEoZB
 j/Wg+ncRaW7/c86grqYsEi0nTc8TieZdSDhlqwg4KECwmntgVG2Px2ziGvJYIUW56hDMKJaVuMD
 VRV6t8WfPo5Q32ibQ3xJ0JAfSn1RlVY=
X-Proofpoint-ORIG-GUID: 51ChTPEqE138m0EfgNmMi5T6gXO8ARjO
X-Authority-Analysis: v=2.4 cv=GI+dgeNK c=1 sm=1 tr=0 ts=6ab50a7c cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=kDAAnAmS2xGMtcqLAaUA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240047

On 26-09-23 12:04:32, Konrad Dybcio wrote:
> On 9/22/26 10:31 PM, Abel Vesa wrote:
> > On 26-09-22 11:33:38, Konrad Dybcio wrote:
> >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>
> >> The Glymur-based Zenbook A16 features an Embedded Controller running
> >> custom ASUS firmware (which is loosely based on the reference Qualcomm
> >> Hamoa EC one with a lot of modifications). It provides keyboard
> >> backlight control, additional temperature sensor readouts, fan speed
> >> monitoring and a number of miscellaneous functions.
> >>
> >> Describe it.
> >>
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >> ---
> >>  .../boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts    | 15 +++++++++++++--
> >>  1 file changed, 13 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
> >> index 40433dc2d6cf..d3356fcd25f0 100644
> >> --- a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
> >> +++ b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
> >> @@ -670,8 +670,19 @@ &i2c9 {
> >>  
> >>  	status = "okay";
> >>  
> >> -	/* EC subdevice @ 0x5b */
> > 
> > So what is on this address then ?
> 
> The driver spawns a secondary i2c device there to service some
> of the EC communication

Thanks for clarifying.
