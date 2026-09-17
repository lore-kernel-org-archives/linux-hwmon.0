Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5C54C10E5
	for <linux-hwmon@vger.kernel.org>; Thu, 17 Sep 2026 21:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789680043; cv=none; b=Hf0hDjqb1gPouJ3Y9y+cAbst3ORWl696bRGakXdPsjnLZ3LmiIBjOZMrZiD/UpiRaWoImk7oFhfatIGp4iRZhfz5w4Ped7l8MoP47xKFsvbUlgsiKwoZdaq844iDIpZ/sPaWhghQIJtyg4mC+wMmXlUauxCIKpVvsy2FzOqq6tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789680043; c=relaxed/simple;
	bh=dD8Gl2Yayu9f4mFvJ5y0Gc2GHpdAwy/EINyeXUDZ4DM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BjNhgGLTv+Chn5lDRvrfCcnpLeEesvfvl+xuqEv7rk6+ZMI54SpPlfrdwQe6zcoUp8/uI6TzVTodzNTALrX8kx865FI8kKNyeY96o3BDOiAdk6pQFqkyxCrm53SuQEFPrzqjhOnvnhjAB0vT3bA50VFV2QTryHnOiun0IhZn4nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n44liHXh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n44liHXh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 492FC1F000FF;
	Thu, 17 Sep 2026 21:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789680041;
	bh=dD8Gl2Yayu9f4mFvJ5y0Gc2GHpdAwy/EINyeXUDZ4DM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n44liHXhU9YaP58xP49f3rNXI37zDi2CwRR4FzeXe5ZNzIhVfO8XU41FJDpqVQDjU
	 Ll93IRdX1o/AbOdEn+e6pVCaqj9E76RiPzO9wNs9AQJmDBti9/LGK0mC90B1Pfjypc
	 Gx0FL9ZBCcY+UMuaA9NGadJ0zmUYdqnPpQ2wTgxx8tWfCsTg54Gm9+PhCO5mj1Mssc
	 DmoOHcAXK5SlJM7Ue12MWIZUbeNRrxHFs3GZxhwRVTYrcTt0QmDyDrvM/ffm/MHGNT
	 Q2+k2iOI6sIBf80xsVxhXLKdM8XC50xisGggK3PgFtpTO0Gg6KoohcQQshfDUYUaTz
	 FE3DTXDPb+CvA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: asus_wmi_sensors: Fix info[] allocation type
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kees Cook" <kees@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260917211332.i.711-kees@kernel.org>
References: <20260917211332.i.711-kees@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 21:20:40 +0000
Message-Id: <20260917212041.492FC1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Kees Cook <kees+treewide@kernel.org>
>=20
> In preparation for making the devm_kmalloc family of allocators type
> aware, we need to make sure that the returned type from the allocation
> matches the type of the variable being assigned. (Before, the allocator
> would always return "void *", which can be implicitly cast to any
> pointer type.)
>=20
> The assigned type of "sensor_data->wmi.info[type]" is
> "const struct asus_wmi_sensor_info **", but the converted allocation
> type would be "const struct asus_wmi_sensor_info ***", as the size was
> taken from "*sensor_data->wmi.info", which is one level of indirection
> too many. Luckily both element types are pointers of the same size. Take
> the size from the element type of the assignment target.
>=20
> Build tested ARCH=3Dx86_64 allmodconfig with GCC 16.2.0:
> drivers/hwmon/asus_wmi_sensors.o
>=20
> Assisted-by: LLM coccinelle
> Signed-off-by: Kees Cook <kees+treewide@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917211332.i.71=
1-kees@kernel.org?part=3D1

