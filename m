Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C121248896
	for <linux-hwmon@vger.kernel.org>; Sun, 12 Jul 2026 14:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783867389; cv=pass; b=SQC0DmtCIGFBHfW1GrHWDY2ba7uFLpQP5Jn3RfnCRaqb6W2SGCq07n91XkN+T8LUqUotGKNQaIdCy3x2dcqOyXGZPA+vXpHyWDjfardPONZffYZ4Ed+FnbGS2qRQ2yN3EqhqEkoXPOz2sYp1HjDV6fx063ZI94n3HCXsQoXqgxM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783867389; c=relaxed/simple;
	bh=pnZ2X0+MIRL60suOzIXNIohxyX26lpfnkqeN7KC7f5g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bWYnlDsYwNTUixFvb9okCh0xUOT81pMHjWXwi1fOIFuyHKHnF6MJk64/UBQ5cRQJwHaXyBWzDtzz3Do3jGFXd5so4JOZMtIMmMSuHEMEecIlLAViFB+3ImaEhKdfdanC9s2KRbHVJDL6GGAcL49vrHKZa7uIU+Cq4fGMETGaASc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ma4JA0fX; arc=pass smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ma4JA0fX"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c9c26a5fb98so1365835a12.0
        for <linux-hwmon@vger.kernel.org>; Sun, 12 Jul 2026 07:43:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783867388; cv=none;
        d=google.com; s=arc-20260327;
        b=Zvj9yEnNrHxN2GEJ2C04vAKuQuxiV3tKBbLCi5fbUeuuSxqGGpzeduxBZN9SkPQs7p
         CzIqQdF44lY9vt73VsdHUKWa2Z1rAmVPM6i5iSatGs9s7FCQQUksRGNDBNdbotrVo8T1
         aboj4BN42cZKlT2UInWcGW79oeTh2N7WOxUc7CIGhKFzaICalE6FxDuSv7cONwFqOjnK
         37dmYwhf3Gk6ZSzwuKSt+ilw05ay8Y4fFhvJsvTjfaNvJrF08gxz6Z4rEJBgTPHrT/ft
         WDVzf2RuaUWTUMFdpFvdDZQZ4kEhlAR57g8wR1NuvL+i/FBo4n7PxrviUybwGhU04tr6
         /52w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pnZ2X0+MIRL60suOzIXNIohxyX26lpfnkqeN7KC7f5g=;
        fh=0hdvEPJRino8wRvGrrw1gATkOs6ExpSix2L2F38xNVA=;
        b=i71ME/vZhK+EEwhVqi4iBgYkrDHd9zkPT6i8e23XGvEjQctUknWraGKPfC8f/gkWAL
         hNkVx6rxd8GCjlOiUvsQjSqlROLJVZ7VcNHwMM/sr1xHFhwc7zTJrX9dwxi4BJOV1HAS
         P6mKyPIZjwupHLXl6G+4SsecEa6KgW3oLyLSNBU3MKQ/bD9xPZb1cxmJwi0wPsLZi/hU
         zgFFoK+6TrDStIXwddYs8ON0cV5kVmC2KBNVZAK9QxkpxJI4ZmSNi9TqdjAWL6tYU9/6
         ziGsPlBiMzeDDAYuF/EbQoUffNgG7Bs+gUA7Tdp6A6s6teLl2yJalMprQ6ux1tmkyOUK
         8nWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783867388; x=1784472188; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pnZ2X0+MIRL60suOzIXNIohxyX26lpfnkqeN7KC7f5g=;
        b=ma4JA0fXnMQSxumW98YjU1eFxVF8X80JdPByJgTe+vRXMFE2zNb+I7Y5uBAf1Jmbo4
         Tc9d+QUxk8bk38vsEsa7HR83qiTBIs7yfnOOfjd6dv+GSYsYufByHa23J08MdZlDGRXP
         OO6+d1iUjdYbgKnMMxVe2A5vAS73noFqKZhS7Xdd0gD+iL0ubUM9Dg/qPU0yUx8sqO0k
         mHQJR8yuymG1pv/9Uai5f5EWZKZYZ0RlnRMdOVJWqNcYdTxRzAmjRLkV2U3W/4iwu8+F
         /MSxk4t/ozagWtBKs594VNF+j85Ku4jCodAZjvZi5UI5jtbT1InqJPqLHSPY8IyDstTy
         wYlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783867388; x=1784472188;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pnZ2X0+MIRL60suOzIXNIohxyX26lpfnkqeN7KC7f5g=;
        b=IFdiWI6J3dlW0zXk9iIRzcJwYmWaJAzY7JnYTfhZKxuvHqolV1fCWd8/FIUA5j3xhr
         i6fBeY6DY+/8P5XF5tQmHxyJdWhRKNOPBnCM+n1xeciLEKpIfqPwYgVZtVas5P+E1SrG
         b8U57pn8l1P++ammNvy9UtEqyfp9GeCG6CylLfhgPqLJVAqEEhuPDrWWXtp70qBAnkDO
         duqVwwgI+9xQukBcVJqB9KEwZZE7qo3PF0/G7Oa89SOqfxdQKg6YRDrEdmPKaYqtGAew
         59o/hTfvK4Qk3Tk8KIh5aVHDK7KlbcG2xT6rzkgWsu7AyqHM8jH3Pv3F1d4iwA6x0Y48
         mf6g==
X-Gm-Message-State: AOJu0Yyq13CLG1npZRgHVG/liLdPJdNW4+UVC97s9pd11fgXmC6AZrnt
	E9b2OZP+39Sbdria/Whg+onAL2/IqilduycbUkITBgAL9USj6OJv/jw2bGIUsXBSzLAE4gLPO6s
	Y3jE52/JFaBVoGl841SaIJCxgYNMTvgIdXW6avu4=
X-Gm-Gg: AfdE7clPDzTGrpDD13ISL3sBDoCwybltVj4GiB9racRZu7xavvx01PbDm0ij9PMfr21
	mrbgsyWUP6WTo3EqSDniDWxLs7XLx/o7tXrTXs6agEUUdAw5P5Spt1MGolgYqKSSwMtQTSwKjdb
	Dd1MZAnl3IKzol8vXqTuLsxD6Yu0LH6BbYyV0JkE6xTlBXC5H7Cl8yBoeB1tm0yHGfgqJFjq/0O
	BMfoXYzMghTT0EoWKjyeLGRRpgc6yDAXfnenWCp8g05ekJPaXm8Okm1CbcY8Sh35aVWDBvwD20=
X-Received: by 2002:a05:6a20:729a:b0:3bf:651d:fee0 with SMTP id
 adf61e73a8af0-3c112d8b12cmr4997706637.19.1783867387615; Sun, 12 Jul 2026
 07:43:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260712130345.1256030-1-eugene.shalygin@gmail.com>
 <20260712130345.1256030-2-eugene.shalygin@gmail.com> <20260712131222.5BF571F000E9@smtp.kernel.org>
In-Reply-To: <20260712131222.5BF571F000E9@smtp.kernel.org>
From: Eugene Shalygin <eugene.shalygin@gmail.com>
Date: Sun, 12 Jul 2026 16:42:55 +0200
X-Gm-Features: AVVi8Cf_Ao-qU_t5PrtBUUfuHhqV94KHSFwQKcbOKxNYK9guDpX7OAkXpCVIZWg
Message-ID: <CAB95QASEHbCOs0rgGf3j90CFO_-BEEXAzfx3UVfaLQXi+tRAvg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] hwmon: (asus-ec-sensors) add missed handle for ENOMEM
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 12 Jul 2026 at 15:12, <sashiko-bot@kernel.org> wrote:
>
> [Severity: High]
> This isn't a bug introduced by this patch, but I noticed a potential
> issue in asus_ec_block_read() while reviewing this driver.

It went full circle; the fix for that is submitted as "hwmon:
(asus-ec-sensors) fix looping over banks while reading from EC".

Eugene
