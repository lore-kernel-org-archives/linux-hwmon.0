Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802BB3B442B
	for <linux-hwmon@vger.kernel.org>; Tue, 15 Sep 2026 13:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789479896; cv=none; b=Js2YzKpgGIwzCkGyGZdQfy7W2x7CBBJWZWgW2VkKLlLEpSqmL8TD6s/wB7C0kWhkpb2/Xi0nME3xCsDvlYZWDR92yXPaVN6BDc0rAe2ovwRwfVLbCOIFGh3rkJNIYi6pNpNjWFwP1+p3s5qo1N94ga1RE3IiKMcawC+gbxM1Bsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789479896; c=relaxed/simple;
	bh=jFeupCcGMgwsqvU4w4aIJHdGn5Jw36sBQt6gLV2ErBw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ti+WhXPUagYSvIRQq2CEO0cO0qLJOVN5HYcLVox3HCUwOvy0C5esKWpUf6nxrRspoTr4MLjTrKn7p0ysO1a/OVfL0T/0Xz5V3/smSb+DoPhD5QhSowEoT24kxM6msDH8S0YvTNKZ+l+gztNVaK56MhRqfNs96vXbz1rYrQbvGRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gxgcHIOY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gxgcHIOY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEB911F000FF;
	Tue, 15 Sep 2026 13:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789479895;
	bh=jFeupCcGMgwsqvU4w4aIJHdGn5Jw36sBQt6gLV2ErBw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gxgcHIOY0gn/KAekPxvTGh+RCLbWp9d0GWYQCKE/jU59hp1TG08alqlVIcdY3roK5
	 6c3vMMPB3f0hLYLPeVuXnWl5jxKKTabjgxxOenThmmB9s9BxAAj2s2otJK897CZ/fG
	 cw8c30DOPs9PElTyKhpXQyYeG/k/SYAU9xVlZ7/SWepZXiVmrz0DzsaMVzRznhAFrZ
	 7DRLDogooKyzSwv0rKDkMgXtSDYn7zPOOaUGEFZ6fY6ZCk38hhyPR7A+ZMjesU+gIy
	 UAE2Yy2kS6xMrdZG5xFk0TyY3dCkU8gS7h17IGvzLGKN048jXD7rilBIjch2ySYA3Z
	 Wv224U+wkWWow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: acpi_power_meter: use named initializers for
 acpi_device_id
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pawel Zalewski" <pzalewski@thegoodpenguin.co.uk>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260915-acpi-hwmon-v1-1-20747f6fd218@thegoodpenguin.co.uk>
References: <20260915-acpi-hwmon-v1-1-20747f6fd218@thegoodpenguin.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 13:44:54 +0000
Message-Id: <20260915134454.DEB911F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Use a designated initializer for the acpi_device_id fields which makes the
> code more readable and consistent with how lists are initialized in the
> rest of the kernel code base. Also drop explicitly setting fields to 0
> where it is redundant.
>=20
> Unify the list terminator to have a single space between the brackets and
> no trailing comma.
>=20
> Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915-acpi-hwmon=
-v1-1-20747f6fd218@thegoodpenguin.co.uk?part=3D1

