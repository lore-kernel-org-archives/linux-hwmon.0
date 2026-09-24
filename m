Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B78337E5ED
	for <linux-hwmon@vger.kernel.org>; Thu, 24 Sep 2026 15:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790263218; cv=none; b=R1/GjIsAJpZzrmQEd9Falq1zcIQydCkEHJsQ69X+qGzxh20iFZ22vX/bPnXR+xA9xul5epxVOTV1n+AhOCbLAjAt+rdQXwzfYZNHXTfQmiQZygEGafTCOEyQPGH6Y9I7IBRB5LtKBnFS62Styp56R60Zn9NV+XigreZGaCBLIEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790263218; c=relaxed/simple;
	bh=4tqAZvNi6zM+4CnePRSZ0BpRZx4AqeNvN/Kmlgb54VE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=e9S6p71Ly+phpiUDgkIAheP6L7oI9dYFnQAYjPWTmi6iw7NKqCRjpYCFrtnymYE8kkSZFBWN3FnCDfZRijOy/f14MBBcX8EkDWx7u9wl9ew1A/bhIiTdsmUHzEUAY8ANam6Mk5shpL1kFmeo29piE0OBg2K64zRCgWMXYWcYBxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B21dKqrv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B21dKqrv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7AFD1F000FF;
	Thu, 24 Sep 2026 15:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790263217;
	bh=5X6/TqrWNbfxa5E/O78aciId2YcAZpBXrf6suSyqx6k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B21dKqrvkTagTtxruezcmzhduBZrwenW8nugJ7YIpJbyZZB9uF0b70wDBKYInklA/
	 mAYbBpSSVxdpppAkpPN3V/iAzt4/XSJPpaXRrh71R0Z8mztL5Q712meRaMeU0KOIdK
	 ZIZ7k3MImPCssJbU/rRumH+ALird9E5zgo03Ru4WOJyp2maVtE5yoEa/VDiGj/aTn5
	 U2Uu5N8yIspSlLkJcwP8C8wf1v2dmhJjwnQY67tKQ9mV/hhlKPkKl4s4Cq91FS8WfV
	 9AdQMTNZEspLHLwyc91gFkeRPvYmWt+rFWIdCO7AOGifTE8R8Cdm2/z2lGWcF4BZWP
	 Vl8z2FDdxMH4A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (gigabyte_waterforce) reject short input reports
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiale Yao" <yaojiale02@163.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260924151133.1233860-1-yaojiale02@163.com>
References: <20260924151133.1233860-1-yaojiale02@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 15:20:16 +0000
Message-Id: <20260924152016.D7AFD1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The HID driver raw_event callback runs before HID core validates the
> received report length.  waterforce_raw_event() reads the command bytes
> and then accesses fixed offsets for firmware or status data without any
> length checks.  A truncated report can therefore cause out-of-bounds reads
> and update hwmon state with data beyond the received report.
>=20
> Require both command bytes before identifying a report, then check the
> minimum length needed by the firmware and status paths before accessing
> their payloads.  Commit 47669bec44fe ("HID: asus: refactor the two
> workqueues and init sequence") added equivalent raw-event length
> validation to hid-asus.
>=20
> Fixes: 42ac68e3d4ba ("hwmon: Add driver for Gigabyte AORUS Waterforce AIO=
 coolers")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jiale Yao <yaojiale02@163.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924151133.1233=
860-1-yaojiale02@163.com?part=3D1

