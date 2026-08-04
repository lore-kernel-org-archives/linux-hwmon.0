Received: from sender-of-o58.zoho.eu (sender-of-o58.zoho.eu [136.143.169.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F7924501D
	for <linux-hwmon@vger.kernel.org>; Tue,  4 Aug 2026 00:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785802572; cv=pass; b=r7OXJsfAIu6m9CSS155ouIJouuTLT5LHZgR7bOgJLzrmIY5LO8w2Z0EJJK5BoNCKDtPX3E43dKvWL/HLb9QIyeCTmDh5r3yU/NzK7+KS92uSy0ML43XG1+u7bbNI9/kNpry3ckpjQ6KWs+7aRKfh23wXB1oVVFsy/t7ikjYFwP4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785802572; c=relaxed/simple;
	bh=9yAO45+O0Vt8jX3jM67cj6VHv/YcgjqUgUn64Lo9sgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZCU7OuTWGODkIMgwBZTRV6DyeIpZWVzkbxe+UGdCkxO8X3a70m8hS5aTCNkpI+u2LwdSBo45oisQ1oSs6ueJhC35f3INQywkWLhs+LNsLLaCjYiflXl3Ah1nmoldc8u5ZnQAAEXDmVa71khA7+6lKkAJVgEsELeoDfkGNZIrTOw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iusegentoo.com; spf=pass smtp.mailfrom=iusegentoo.com; dkim=pass (1024-bit key) header.d=iusegentoo.com header.i=ali@iusegentoo.com header.b=NMWYbB8h; arc=pass smtp.client-ip=136.143.169.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iusegentoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iusegentoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iusegentoo.com header.i=ali@iusegentoo.com header.b="NMWYbB8h"
ARC-Seal: i=1; a=rsa-sha256; t=1785802537; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=EKa6oogpdGnFR0PYlcfC2PhmJUTVezQB+DyNxhDlneWMECouZfbrXmzuU192FpO+Zyc3bBRPMSmd3f6dngkjf0NyAs7yUTpGxllKVXSG5OXgeEyz32VFE+AeW/phUtvSbgdJbXh9DU45pA/h1OtyAV4AvYs0EzGp49LL42ADZNM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1785802537; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=R8sD4w8Hh8NNPa1jQyhV+1RURVN7z80kQEpHTPNZkGE=; 
	b=codJ9RBb0Pg7+PpeG/7+v9JO0mZEQ0SgBST+6fUHeyJI16Dd+FjmH1nDj+ovT+lG4C0OnUWhRcy/i4F7Q8eZzoMmu9fnJch2KzbDx6lnCSDDf0RbIEBWNIi9eht+JmDZaGWnvuuvq4pjN/cZyfuKfddaRic3dHT/dKM2PM13CZ8=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iusegentoo.com;
	spf=pass  smtp.mailfrom=ali@iusegentoo.com;
	dmarc=pass header.from=<ali@iusegentoo.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785802537;
	s=zmail; d=iusegentoo.com; i=ali@iusegentoo.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=R8sD4w8Hh8NNPa1jQyhV+1RURVN7z80kQEpHTPNZkGE=;
	b=NMWYbB8h99MEeB8yWKGmF/HczPLivm4VUj/wER3kJeyuoJlWkTKJoOm1ZFe3YlTu
	BZqv+/hfHE/7JGB7/rSqc2VLzRJeYKnRMJ1QG/yWBCL47CAUm8d5Y+1ZmxdCFuft846
	Y+YywcaV2NtjL3325gyyXl75P4Md1V4uzVulFvpQ=
Received: by mx.zoho.eu with SMTPS id 1785802535804974.849634054169;
	Tue, 4 Aug 2026 02:15:35 +0200 (CEST)
From: Ali Ahmet Memis <ali@iusegentoo.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>,
	Wilken Gottwalt <wilken.gottwalt@posteo.net>
Subject: Re: [PATCH RESEND] hwmon: (corsair-psu) Fix linear11 calculation
Date: Tue,  4 Aug 2026 00:15:06 +0000
Message-ID: <20260804001526.211161-1-ali@iusegentoo.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803232156.2340048-1-linux@roeck-us.net>
References: <20260803232156.2340048-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On Mon,  3 Aug 2026 16:21:55 -0700 Guenter Roeck wrote:
> +	if (exp >= 0)
> +		result *= (int)(1UL << exp);
> +	else
> +		result /= (int)(1UL << -exp);

This breaks the build on 32 bit. result is s64 and the divisor is only known
at runtime, so the compiler emits a libgcc call instead of a shift, and
__divdi3 is only provided by sparc and parisc. SENSORS_CORSAIR_PSU just
depends on HID, so i386 and 32 bit arm are reachable.

On this patch applied to 2d2338c93da7:

  $ make ARCH=i386 defconfig
  $ ./scripts/config --set-val CONFIG_SENSORS_CORSAIR_PSU y
  $ make ARCH=i386 olddefconfig
  $ make ARCH=i386 vmlinux
  [...]
    LD      .tmp_vmlinux1
  ld: drivers/hwmon/corsair-psu.o: in function `corsairpsu_get_value':
  corsair-psu.c:(.text+0xa0b): undefined reference to `__divdi3'
  ld: corsair-psu.c:(.text+0xa63): undefined reference to `__divdi3'
  ld: corsair-psu.c:(.text+0xa83): undefined reference to `__divdi3'
  ld: corsair-psu.c:(.text+0xaa3): undefined reference to `__divdi3'
  make[2]: *** [scripts/Makefile.vmlinux:72: vmlinux.unstripped] Error 1

Only the divide is a problem, the multiply builds fine. div_s64() would do
it, or keeping a shift on the negative branch, since the divisor is a power
of two anyway.

The mantissa fix itself looks right to me. ((s16)((val & 0x7ff) << 5)) >> 5
puts bit 10 of the mantissa into the sign bit of the s16 before the
arithmetic shift brings it back, which is what the old order failed to do.

One small thing on the changelog: it says right shifting negative values is
implementation defined and that multiply and divide are used to avoid that,
but exp and mant are still computed with >> on values that can be negative.
That is the normal sign extension idiom and fine in practice, it just reads
as if those had been converted too.
