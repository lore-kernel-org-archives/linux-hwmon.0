Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266B13358D2;
	Wed, 19 Nov 2025 09:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763543244; cv=none; b=GLJTt86AFrLUk6eLoR3DrjgEuznxCrakrxHowACesR2h8n5Iv0yWBarS+2wMzjRBzd3R9nq2HFIR2WxVPhlnsE+KXAs1Sw3vpsAiMGo2vKsEYcqdXslWpXYANZeUSegVPEDpX5e3ac5aGjdzsfo4HY4Cn1jqYx1PFYqc9sIEktU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763543244; c=relaxed/simple;
	bh=5aGbQnNu7VeCtmdDPe9PIkGt59gXDKpdTJ8IqN30Op4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=szzPFrM7KSPovkc0FAepgbfOLUPxRvyq2GiqqySjz4YRGpJ8apK+2MAmxDo/irFh5CCtrA2kFqNKLI9tcCntSCZ4yD+OwW4nYgue473h39P8/BXi+lO+hMsztkvJeLOt6AM6kzcmTg3F10gLBnvtUWZ4/sO9aEueVAiZwfEmw7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=e6VEBqJ3; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="e6VEBqJ3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id; bh=5aGbQnNu7VeCtmd
	DPe9PIkGt59gXDKpdTJ8IqN30Op4=; b=e6VEBqJ3Tea115MWFDCb6ETYE5o+mJO
	BpkGva7dUXO3HC80EBxota3OPoS7nSNAC8BKVYlGVTSSNNWytMmel52dLsL96LqA
	Bgmrt4JRrErYjFTiGMYsb+h7BOSnmz24Vk56sAVIxqn9Gum3uVDCu8fbUxlM4jc9
	qjcgnC/EODGQ=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wCXqZqNiB1p1i4+BA--.231S2;
	Wed, 19 Nov 2025 17:06:23 +0800 (CST)
From: Wenliang Yan <wenliang202407@163.com>
To: krzk@kernel.org
Cc: conor+dt@kernel.org,
	corbet@lwn.net,
	devicetree@vger.kernel.org,
	jdelvare@suse.com,
	krzk+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	robh@kernel.org,
	wenliang202407@163.com
Subject: Re: [PATCH v2 1/8] dt-bindings: hwmon: ti,ina3221: Add SQ52210
Date: Wed, 19 Nov 2025 04:06:18 -0500
Message-Id: <20251119090618.60538-1-wenliang202407@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251119-tremendous-skunk-of-science-aab7fb@kuoka>
References: <20251119-tremendous-skunk-of-science-aab7fb@kuoka>
X-CM-TRANSID:_____wCXqZqNiB1p1i4+BA--.231S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZw4fKrykCFW5KFy5tr43Jrb_yoWDGFb_uF
	y0qr92yayUJr15GrsIkrW3Zryayay8uw1rJw48trW7K348XrZ8JF4vkryfAwn3GFs3KFZ3
	Grsxtw1rG3W3ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7VU0JxhJUUUUU==
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/xtbCwBDnu2kdiJCz9gAA3l
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

At 2025-11-19 15:22:38, "Krzysztof Kozlowski" <krzk@kernel.org> wrote:
>On Tue, Nov 18, 2025 at 07:51:41AM -0500, Wenliang Yan wrote:
>> Add a compatible string for sq52210. The sq52210 is forward compatible
>
>forward?
>
>> with INA3221 and incorporates alert registers to implement four
>
>But this suggests opposite.
>
>Your driver changes confirm that even more - it is not forward
>compatible. And in other way why wouldn't compatibility be expressed in
>the bindings?
>
>Best regards,
>Krzysztof

Perhaps my use of "forward" was inaccurate. I only meant to express that
at the hardware level, the SQ52210 contains all the registers and
functions of the INA3221, and builds upon them by adding current, power,
and alert registers. However, these additional registers don't require
adding more specific properties in the binding file.
Are you suggesting that I'm missing the description of SQ52210's
characteristics in the documentation?


Thanks,
Wenlaing Yan

