Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3886543F8B8
	for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2026 11:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784633925; cv=none; b=dF+9flZXd4ZkA6IxLKmMAC/z9WOzFwMMnRmW8IIInGdMV3fRF0boOiwpCpaLo5Cj1WGOEM24aDq/LZSUPEC0ZxybRMuRfxs5aO5/SU/g861kXo05Mqn3u6FGDMmP1lRHPJ6pgrffg98cWcYzyhg0TXNEjSysdhVV8ez7doHbFoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784633925; c=relaxed/simple;
	bh=zNshJn/c6IOOJ/rvSuHsDToyKKbuVeyQfFpR8m05c1k=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version:Content-Disposition; b=Rfjy7CSkg/MQ5/NHO3u2UJ+1GXK0wZeoHfbzSAVjrkb2N5O5HUXy4cksVU0mkqbd/n0GiqTxteGPIYOrNnic/IzgohrXwUQ3EINr8YIF/2xQnu6xCQ+dxBFCQ2MsRvmcnsVrteW6fjHcJPtashhAPFOPAaeGBH8dkD/pSxFkvLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=XJoPdW3H; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="XJoPdW3H"
Content-Type: text/plain; charset=UTF-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784633911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B6lhiI2q/qZYGGxt2f3OXZ7gIkM5jB/KE2hFDF6ccMo=;
	b=XJoPdW3Hc6jLvgUnVBwb9sH4DnHCmHhDs4pvW9YJs6eWqinQYRMhBte5HrQce3jqKawL9I
	aGCMgaI1iCstyqI82p3cjEqnCAeJsdLipXVjOeUtAFLoG3HljKiP65Ct7p9K+okQYQjPl7
	wnmd5TPt4jSRBWPT+Vid6KU1NHkxpg0=
Date: Tue, 21 Jul 2026 04:38:14 -0700
Message-Id: <DK47X10AGZL8.1E8TQ4CGTYI5W@linux.dev>
Cc: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-hwmon@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v2 2/6] dt-bindings: hwmon: Move LM63 family to a
 dedicated binding
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Troy Mitchell" <troy.mitchell@linux.dev>
To: "Troy Mitchell" <troy.mitchell@linux.dev>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Guenter Roeck" <linux@roeck-us.net>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Yixun Lan"
 <dlan@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan"
 <skhan@linuxfoundation.org>
References: <20260721-ctl2301-v2-0-ef5fb342872a@linux.dev>
	<20260721-ctl2301-v2-2-ef5fb342872a@linux.dev>
	<20260721095822.1E9631F000E9@smtp.kernel.org>
In-Reply-To: <20260721095822.1E9631F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Mutt-References: <20260721095822.1E9631F000E9@smtp.kernel.org>
X-Mutt-Fcc: =Sent
X-Migadu-Flow: FLOW_OUT

On Tue, Jul 21, 2026 at 09:58:20AM +0000, sashiko-bot@kernel.org wrote:
> [Severity: Medium]
> Should the interrupts property be explicitly defined in this block?
>
> Because the LM63 family was moved out of trivial-devices.yaml (which
> broadly permitted the interrupts property) to a dedicated schema using
> unevaluatedProperties: false, device trees that correctly describe the
> hardware's interrupt capability via the ALERT# pin will now incorrectly
> fail dtbs_check validation.

Good catch. The trivial-devices binding allowed one interrupt, and the
LM63 family has an ALERT output. I will preserve that part of the existing
binding contract by adding the following to the dedicated binding:

  interrupts:
    maxItems: 1

                                            - Troy
