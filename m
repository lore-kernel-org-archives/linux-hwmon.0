Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3095643BDB1;
	Mon,  7 Sep 2026 08:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788769074; cv=none; b=bOvCupJVbADFcmPq9Qu/4entc+aKE3jJKT+OrVjs7EvA7XvrWQsAxAYmLWBxkAwSQXnk6KJioytekCaLBE1Zq0Q/UUI98Jkqy4LoKyavRmrXEmBNyB19KbKSHuiKkuno+wPwCxHunFJ7BKmFcP5RPbKyXMqQmm/7wlh/D85W/ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788769074; c=relaxed/simple;
	bh=PIqd3RflDOgROG+IZb17kJS/+Y5J7OU87+JpKvrDIPA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SpGJNPKFClQGG9cjHqvMeKcbWvIhJgDNMZmISIoNmfVMi0gVo/uqC0wiAGmFPyoIXg+YwWiFKW/ZpSpMg2qAaoK0zI/bu/wsRxU/YF6/Ffnfwx190QHTNKMlbxO3NpTuQpUBaOXbOdzNOKp064ZkoSgtlRSQTyhuAW5MAos1stc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YrKvFx21; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YrKvFx21"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ED611F00A3D;
	Mon,  7 Sep 2026 08:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788769072;
	bh=PIqd3RflDOgROG+IZb17kJS/+Y5J7OU87+JpKvrDIPA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YrKvFx21oUUwBelJseydDxGArwEhvCTDxXRMHMaeKusxT3wa1KVtskMpUkuw9JU4g
	 w7uUqLMbCSJT5qtzc1troXidrjMcv90kkgrSVYKgmmszdQvpCQfC+r4tvaISgOVv/r
	 qSErHdfPwBTxG/4C+u6nzQWcaBFUI7J0wYWLcXByjniPu24cLHC8dXrfE0zF0sNNuY
	 b2VdgihWPZz5EBrsbGEzRf8MW2arUboW8KM8Vhi6KoOdV/+UkADWIyubmdCBd6ap4x
	 tAvGXlVyKbdIf2Nrv3MYxHB6stLJ6eat8xt1nRgD4t16nhj+110/MKgFVwNMRlozvQ
	 5dpUKgnCl5lVA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1] hwmon: (lm75) Add support for Nuvoton NCT7715
Reply-To: sashiko-reviews@lists.linux.dev
To: hsyemail2@gmail.com
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260907080831.11281-1-syhuang3@nuvoton.com>
References: <20260907080831.11281-1-syhuang3@nuvoton.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 08:17:51 +0000
Message-Id: <20260907081752.3ED611F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Sheng-Yuan Huang <syhuang3@nuvoton.com>
>=20
> The Nuvoton NCT7715 is compatible with the LM75 temperature and
> limit register layout, but its 16-bit configuration register is
> transmitted most-significant byte first. Add support for the NCT7715,
> including byte-swapped SMBus accesses for its configuration register.
>=20
> Handle its conversion-rate field and shutdown bit separately, since
> their bit positions differ from the standard LM75 layout.
>=20
> Signed-off-by: Sheng-Yuan Huang <syhuang3@nuvoton.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907080831.1128=
1-1-syhuang3@nuvoton.com?part=3D1

