Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7619A4E0208
	for <linux-hwmon@vger.kernel.org>; Thu, 17 Sep 2026 15:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658478; cv=none; b=DgIGwUZgXI52gZVHHifaGapyHLiP5WQ8fnExe5jbLigAWJagU8Ii//H1SHTqPRxwPuXxPKMNKH/Cxp1+YbHmhIbD8tD6MrlsZlxmXUWghHEGJ0Ezf63vkHV7Njox0TlMc5prBlQdxBUP+PR0S9igfLsOHQeu7PhqdXg8WHdHxrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658478; c=relaxed/simple;
	bh=twrgboY+FGQmnsHlBPho3Q6UZGpTdmrg5WyreHCXpw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iIkA/Ow8YsTAyTWzs9cyLZ1xmNxr+P0wb9bCi6nxjjWA2xBsbX7bsrxAXh4Srg0QytuszXnvAJd7Gtnwcden1s9f2FBeWbzDJMQhQlws49PYnz/LtVmhwwvDbltHKnDRlCguCpW0NWYLeY7QM8O7e3ktSM6pjfwmVFOy5JqVRwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VELQo9br; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b98Nm+le; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VELQo9br";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b98Nm+le"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDiMk42086397
	for <linux-hwmon@vger.kernel.org>; Thu, 17 Sep 2026 15:21:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/tTW+lLwHomb6oSOol9clHo+
	Od6D7SaNe+Gbi8U5oxI=; b=VELQo9brRFGtw8IueZoNq4B0AdZhmVoNKND+Cnsq
	cb8hPrgnbgtKLsYNu3YcasMGXlubsgn68qzsfrAwcayO5YwThR8QdFJCm58jw9xi
	nuXyQNzYzFeZ4w7jL4RPkfXy9cHpNMhwx4IhHE8eLmyRzzUQhnMioDnxAbbKfSFQ
	Gv6ScnRKWAvL4KkcwalF/MhCy6OF0cPSFIyfWn/qwoJWncigxda/DUm0CVz8O7VO
	qneFxFL/RZn9tNSU3hiLNoWGp9krqVm2xRb1tWczizdAaDl7IffprzwHTG4MXdrH
	uSwmtGLGNQrGcnDnAgRK3IJZZslgeoES7tLYcJwKm1JvWA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grfu4100e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Thu, 17 Sep 2026 15:21:02 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91219341db7so17683526d6.1
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Sep 2026 08:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789658461; x=1790263261; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/tTW+lLwHomb6oSOol9clHo+Od6D7SaNe+Gbi8U5oxI=;
        b=b98Nm+lePUNg2PLFUj93k6QL2U61jXjyvU1VKo/Idl0u5HN/0HUQh5KNReK55m+vlB
         InLO7u3WO23AaK+u0J3becLhUIudA3W9jfSg+c6wniX21EdFHfIEjumTMJi15o3XPG1X
         TA3gSOPN+wzGL2mmpDnxDDqqp4eDwVoH/JwROzlLzfFvf3bwLASg1UTzdVekQl/H40GH
         0uUrBZ4ueG09gI5psYMbV4Aib0RF99g2YIh3B2uh5fs5z4kdZRK0sJ/ZlRWqn9MGM6bH
         ivTrf1zi9GXS4D8BCdEf70z5YsX8z8Dy+VdvTH9fe7OICleiRJStY1xASBdb63wzvJva
         itIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658461; x=1790263261;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/tTW+lLwHomb6oSOol9clHo+Od6D7SaNe+Gbi8U5oxI=;
        b=WilPP+KwKWbRNthOglgZ/e+bmuWScugcX6PG/LX/2zGee84KOb73bqPj0Wf0D3YCxo
         ifxgR3aOrWlz7zSO+Ag4w6BE9ILPxCUxaeR130aymn7fJVMqCVY0g90ToT3bqvzNqZZQ
         Jkg7ay7//7Y8a5PpGMUEa0PLfs4Tq6TX415PbGYDVJAb/3aS8WICH4cjXc3UOWaySxe5
         4SFZ1jdSpmi47rBL4wdcqvsZsiZImC0pQ519kv/Nu2UlCPciIcJfNFwnbvEf+fDHnJUf
         8HDk1j3vhqHdQXvFhRMokJSiZ+7vBD54Xofl8dO5z8iKkkhH1xJ949e9cNu+UPIEfYz+
         sxQw==
X-Forwarded-Encrypted: i=1; AKwUvByUjlYg7c+rTEDqzzfQDBOA3V0LZ6ZxR+OfQ3Ly0wRYmZ3y8t4zIEl+WiF6LO88tv6ORJjfu7erco9ccg==@vger.kernel.org
X-Gm-Message-State: AFuF++mkH2YTu0UR0+0IoodJT0cAMy2dCSFy56muSkDp50VHWng3iEyR
	H1jx5sQh6gkUNY98yGA54XIwIZpWq/aD9iMv8zB4JpigCuuQeLyvdnHosaQ3pA1hqXDcE+h6sDU
	wRDMmwKgyjxTAyZGFKX8A1Fy/RosNmkjJLSWR10UOFOSk5u69vnPEmt05W0R9PdGpsQ==
X-Gm-Gg: AYBFou2LIoRK/8q16Ka6LATXaGpviG/KED4wCjT9g78+mbF01phXZC6+OL2vpTBtjXY
	mc5C5lAWZ2Jw422ACZZG+Bw3OTdc6Fak2DY0S6RqW/Wui5ZcTELfN92O1QE7sI+gJW8ZK4a9Atv
	Ziad830p+zaUq5fOYPivzcLBel6HrwoIyHIn3yeGuSb/7yidEcp/+DDAZdXcXjnaVtlBlav1j0S
	Om4eS78O6S2Izf6Q1Z2XEfOWhsXnmic03+mzXofi3M0895Stazmt8XO/8aJWk/i2pZ0VFopvGQw
	s066f3gyAn0Te+8NVz8kn4Uw1bxGhaZbmNYle4gCk0VJu0NyphadgKg7bq8CrYDQrDrzHW086yz
	arvcvfQh2Nq8tWqs=
X-Received: by 2002:a05:6214:5017:b0:912:517c:119 with SMTP id 6a1803df08f44-912517c08e4mr12930726d6.57.1789658461258;
        Thu, 17 Sep 2026 08:21:01 -0700 (PDT)
X-Received: by 2002:a05:6214:5017:b0:912:517c:119 with SMTP id 6a1803df08f44-912517c08e4mr12929806d6.57.1789658460638;
        Thu, 17 Sep 2026 08:21:00 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf27198sm16392480f8f.15.2026.09.17.08.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:20:59 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:20:57 +0300
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
Subject: Re: [PATCH 3/3] arm64: dts: qcom: glymur-zenbook-a16: Add Embedded
 Controller
Message-ID: <j74fubwlkynw22nwsof3wylypf77ptrwbg64q6tmldvh7ckq7r@6nsl5fgiut3r>
References: <20260917-topic-asus_ec-v1-0-373516d347ae@oss.qualcomm.com>
 <20260917-topic-asus_ec-v1-3-373516d347ae@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-topic-asus_ec-v1-3-373516d347ae@oss.qualcomm.com>
X-Proofpoint-GUID: O2Ie7VhKXwCxqpxeM8mK9gdbbnUGi-8t
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIxNyBTYWx0ZWRfX8BZGXUVT4mr2
 U105GNL92N3CGcW/PaSAhBbIY16Mj0ZeHCI743s4TWdQyhbqTIw1KnB/Dfa5EPjx7Ni+nD+1lhc
 lWvy23Ku0+30YF0mFZFkGkHtcO9rU+c=
X-Proofpoint-ORIG-GUID: O2Ie7VhKXwCxqpxeM8mK9gdbbnUGi-8t
X-Authority-Analysis: v=2.4 cv=LbipeTfi c=1 sm=1 tr=0 ts=6aac055e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=-FifcBtKAQNI-ioUATQA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIxNyBTYWx0ZWRfX73zAGbYSbFb9
 x/e3TJTSoQXyt29HVcISMkEtcoAZ1qCAWWKsPmLnkJY0qwhkb9fJhd9l71JVUnggxqEt7M7j3jq
 8iqbhZ2IRE38SwdYlEMkyYm+yuhGSB7crduYYwfkVtHdvdOzl4o7BhnOcvaWC/Hmes5ujraYLoA
 V631cf98R1GrQcj12RN0X9gQuenA3JdBYc09Hq3CXTs0Y9hS7dEk6tmRO/tdobV9niLInlWgI99
 e8RkG3LeJKZwE4Zt7UvPHJkUGNJ0jk3+vZF/jyX8YROY8HQhiY5VuQCV0dkni4+S4a9TVtPaE3X
 a3SMAMmtUt0JZUvGI92BAOwl221NezGUuMifVOgCv8NXDUnvCmbwWqP9tsO7iPQ6UeIQEgWtx6r
 eAW0n+M5XooxTS2tCSRNBhhcCcyCZJ1gFDDa3J8zOcs15hPr+1PL2xA5/KR7QEJfkWdKhMWz7cf
 ibDtAhfkRarGBD9K5lg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1011 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170217

On 26-09-17 12:54:58, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The Glymur-based Zenbook A16 features an Embedded Controller running
> custom ASUS firmware (which is loosely based on the reference Qualcomm
> Hamoa EC one with a lot of modifications). It provides keyboard
> backlight control, additional temperature sensor readouts, fan speed
> monitoring and a number of miscellaneous functions.
> 
> Describe it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
