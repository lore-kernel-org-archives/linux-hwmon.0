Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A21263C8F
	for <linux-hwmon@vger.kernel.org>; Sun, 12 Jul 2026 15:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783868851; cv=none; b=pXEWWx30tQJF+xwliIMf1tYHK0IFLhYEmGliiQsSsdEwXkUnVnHHA2/awfXW5yWFu10ucBZu4MharMvg+2NMSu2A4AkppJElrj50M7LWk3Opabmr8meHWLykRmsSdchCEg58oJ4yUkPMsH8cEfAWkHOizWVTOnvNi86NEiaRrxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783868851; c=relaxed/simple;
	bh=ZSB4Elf0rRVtvLUXxlHu8xNkwNCNSUD6s3xXtjmCl4U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jAnWzYxbvp2PZLQj7oeebXwe2zS/yXmqE9hi8Ei4emYGiM5Bk/h+m4RhRWvZTAhWkCkYTMOLrpg60FY2X4M7F0cuXIVX+j9VBgtgR8Qt9dAwTgZSmfx9qpUlH/vT1N/t98Z+7IB9xqKkOPC6XzswA1r22d/iiNbZoFaJpkSUg0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jd/cs1i+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jd/cs1i+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 699B01F000E9;
	Sun, 12 Jul 2026 15:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783868849;
	bh=ZSB4Elf0rRVtvLUXxlHu8xNkwNCNSUD6s3xXtjmCl4U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jd/cs1i+kFczT5MKNaNIxc6TgSvypnTueDqy+Y1spiTatbZCslwXYrYTEmvxeg6jP
	 f9HmTyKSFC7JnJzy3Oh7VOBfzlEu8S+k4geRJ7rj+l4iHEL3nMi12NHu7hDB67pQJU
	 yB/SqW4RlDryfHBxJcY1fndl86MgXZ+kAGTKx+Ca1ppkB4HJZniPdIY06ylbjSMM5r
	 UkgfFkolVxxpdDhUZpHVGuBp4+8OnkxTDJwn3XpVvFql5zli/XKnr92/VBSHuqy/nD
	 S07H/Z3LTPQJxNVVlujrZJ5hJHEAl2z+ILV3i3Uxe0sz0eKTh8E97Uz+kdJjLg03fX
	 X2+NQR2ArfSiQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/1] hwmon: (asus-ec-sensors) add missed handle for
 ENOMEM
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eugene Shalygin" <eugene.shalygin@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260712130602.1256700-2-eugene.shalygin@gmail.com>
References: <20260712130602.1256700-1-eugene.shalygin@gmail.com>
 <20260712130602.1256700-2-eugene.shalygin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 12 Jul 2026 15:07:29 +0000
Message-Id: <20260712150729.699B01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add missing return value check in the setup function.
>=20
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260712130602.1256=
700-2-eugene.shalygin@gmail.com?part=3D1

