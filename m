Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7AEF374A04
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 20:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781124096; cv=none; b=kgrjfCDpcNMSueNR0kTgzqe0HgIj1kCOdmugcTQkRZbMmz+9IBUdgmNhDuIcaBOXryuUvCVMcBHMei17MB9Uq4pI/7uPj83GvFvvD2a7F1zrd7O/vLubJyCPgkg7i/P5vf7PqJJHm8f7RMi9F/wOB4WWomAzNDKzkNUDIoprgV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781124096; c=relaxed/simple;
	bh=2quOiTRllJSdlfuUDeQWJdXpkZhQcxEBc7PcG+BRR4A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jZs1P6qUWo+epH9GcI4SYal3jb/gpORvAxJFQTE4Gta7lEs9PEMxhZdUbM61CUJSUuJjxNW2H9CV+24d3v6HsVxrNawxQvOkBt+9l3d3YfrZct6ZJUWqA28GGlNJFb6JU5fybMXkPJk85Sjcy9UJOjWfo+cB1K3jxkpweq6l1Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PZovo0O3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PZovo0O3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89A011F00893;
	Wed, 10 Jun 2026 20:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781124095;
	bh=2quOiTRllJSdlfuUDeQWJdXpkZhQcxEBc7PcG+BRR4A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PZovo0O3+1pAQUA2Font+DFBdNwFsCjEsE+EriuBX5KPzRWJoGFaHG7OY4a5+klQz
	 QT8qOBcxtt9hq0ReF+/CqAwlqUrb/ffTUd2s4UqC2P0IfDY3i+Sq6kyLOTyvt/UppA
	 YcjiAjRlgwAuSYqjc2PrUVCjvL35DynrYb8EjWmX5Csj7/NA+fcoz4AWJFYVe4C/JK
	 lsEVP36YPwFQ25pJT6EPWTw7bj307ovQXsU0B9AoOeLq5lGsVLXWTxSwdTdwd81q9E
	 ynw5Q+FqnV0/mkdluoJXQn0SC6qylnAG3/yQljlycbDezW2RQ6lTqcHdOngc/NvTSC
	 ce4JioSqdgc9g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/9] platform/x86: dell-descriptor: Use new
 buffer-based WMI API
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260610203453.816254-2-W_Armin@gmx.de>
References: <20260610203453.816254-2-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 20:41:35 +0000
Message-Id: <20260610204135.89A011F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Use the new buffer-based WMI API to also support ACPI firmware
> implementations that do not use ACPI buffers for the descriptor.
>=20
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610203453.8162=
54-1-W_Armin@gmx.de?part=3D1

