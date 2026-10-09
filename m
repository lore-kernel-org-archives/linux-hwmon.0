Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADED736B90E
	for <linux-hwmon@vger.kernel.org>; Fri,  9 Oct 2026 15:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791560843; cv=none; b=IA+8L4Pcxjre9+y2clVsprTZbdq252gQqFOaGsiboURqVkSC2a4LQ0NqJ04q2G5zgL/6X5ZAYKzORvc6b3uPnDmpnZHng4YzJDjSb6kW+6isRjc1q4LFdkJEY53U2uVkAU7en6ukjd+gpaKvwu5GNM9aR0hP0icGJZhcaiVC+kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791560843; c=relaxed/simple;
	bh=sMH/OURd2NKyuqdbnOAXbHbEbPT5Ye5NHx0yIV38y4U=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=DCIxC0GhjSVmbiBBuooLehwe1OoFlXXM7NxqqjFzTCyngRI8GzZWXKpCEMKtUvtSJzOGw2nnH3zgXhb1yB04uzqloL4uKur3Sy2cvU1Qop+Zz9OuCLWSbrA7lvjjh8qrk5ZfZrToN1KuD8fx97c7ktJoE0jAMlURCVi7gmuip7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QYr0m30d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QYr0m30d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 255981F000FF;
	Fri,  9 Oct 2026 15:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791560842;
	bh=sMH/OURd2NKyuqdbnOAXbHbEbPT5Ye5NHx0yIV38y4U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QYr0m30dOIPNprOtkJFlJpgXOfSNY+VrqiTCCi0vr+Yvv/edqGlSwqBThd7wohNnG
	 R92cNhNmGokiA5HXFTL59AAgUFgckm8p9lMFBsD7reqsuvggbdqcmd1x+qsrwREE26
	 ET2/TRPaT8scgj3z5wpnfhOokujN4B0F+As0lD+1xT1OjN92uR7AKQkYvhAv8Q8ia3
	 rwx3RNK8rwBwLmlM9Sdx00ouYDCS7gR/ng7Z8ZDRueHiuLuTungjEEGLa0HjZqcPKp
	 JNV+Ed84gCij6bCZg0imjv1MqjAKGcW+joMHU0AUkrZmPpk+JFWbuszqvUiLZ+GNr2
	 6ph9nDcrCgxsA==
Message-ID: <sashiko-outbox-165795@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/5] hwmon: Expose attribute validation and string
 helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jihong Min" <hurryman2212@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <c0e04710f5a3a555e9d7b42b8f9ee369311cca4c.1791559095.git.hurryman2212@gmail.com>
References: <cover.1791531025.git.hurryman2212@gmail.com>
 <c0e04710f5a3a555e9d7b42b8f9ee369311cca4c.1791559095.git.hurryman2212@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 15:47:21 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Expose the core's string classification and sysfs template validation
> through the kernel hwmon API. Let drivers query these properties without
> maintaining separate attribute tables.
>=20
> Reuse the helpers when creating attributes.
>=20
> Assisted-by: Codex:gpt-6-astra
> Signed-off-by: Jihong Min <hurryman2212@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1791531025.gi=
t.hurryman2212@gmail.com?part=3D2

