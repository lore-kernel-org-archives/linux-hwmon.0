Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C6846DFE0;
	Tue, 21 Jul 2026 18:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784658988; cv=none; b=TvSH46oEpH0tHDYvKmGinjtzpyqoOu3YUcXR7cjMio0AhSSyvyzk23q+nXHEfZF4pdiXAB9IRNSQD61Frm0rEMJH5JRsHiHJSNORioyaoH8YdCI545z4gs0i1y9NMtQUA0uymoDzUMmhpYT6x6jxOcHTU7gfnfCErj7g5x8STw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784658988; c=relaxed/simple;
	bh=OJEnCoxSXbE/CPB8QaRhl6jgcmUt6jl2rwT+ASZn+7g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ol5RSxwe+AAk9Kdf9UgGerzaf7TqQd4CIEMNH9pWf2/s7LsaAv4BSJMMdo/vMSd7HLRjhUhVbi+LeNFUhx1oOsZlDhy+Q5grz718sNv7HK+yYlUDpnkFH/oSUbYF2Ki4XOJOdBterGSudNsvIsB1WTqmhtlljZG21Ajp1E1ElKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T+bt3LsT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T+bt3LsT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFD1A1F00A3A;
	Tue, 21 Jul 2026 18:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784658987;
	bh=OJEnCoxSXbE/CPB8QaRhl6jgcmUt6jl2rwT+ASZn+7g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T+bt3LsTwkVVeUGYRM0PLvJWvrijXuCe7zV45e7yTOirhp7r0DobaIYvz3alxGJ8P
	 /ABXz6aBw4ggbZZ+vH3JMdy+CL52F1aB/GIFttq+Dpdc0id+6qVpG6H/Ft+sp8TSk0
	 alJgm/RjIizFZZljQvCCUaltGXlE0hSbNAmjC0gc/axUCVGsrcF1TJsY6JnSTwMuDQ
	 hPvJRK2QtmWSvM0pI0PVuiIN1YxViBVqSKBNVA6iEkFFM0sNutVm+xpVX5ZaJcq8Jl
	 GEsIm6TWgLpYrIorPXD5GuBRmHk8KRVlbSLvTMDcflCZcO0PVPETslCl8qRf0jMOIe
	 tEpHHkobhRCdQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 01/10] dt-bindings: hwmon: Describe Qualcomm BCL
 hardware
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manaf Meethalavalappu Pallikunhi" <manaf.pallikunhi@oss.qualcomm.com>
Cc: robh@kernel.org, linux-hwmon@vger.kernel.org, lee@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <20260722-qcom-bcl-hwmon-v2-1-febe2805e17b@oss.qualcomm.com>
References: <20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com>
 <20260722-qcom-bcl-hwmon-v2-1-febe2805e17b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 18:36:26 +0000
Message-Id: <20260721183626.DFD1A1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Qualcomm SPMI PMIC BCL (Battery Current Limiting) is a safety feature
> that monitors battery or system voltage and current to alert system
> for overcurrent or undervoltage conditions.
>=20
> It provides:
> - Real-time voltage and current monitoring
> - Configurable thresholds per channel
> - Hardware interrupts when thresholds are violated
>=20
> Add a DeviceTree binding to describe the BCL on Qualcomm's PMICs.
>=20
> Add sensor type to SPMI device list for BCL device.
>=20
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qua=
lcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-qcom-bcl-h=
wmon-v2-0-febe2805e17b@oss.qualcomm.com?part=3D1

