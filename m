Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17B4450418;
	Fri, 21 Aug 2026 09:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787304209; cv=none; b=D14iTTgM0S/85YXasTaxsZ5hfO6o8XGTCus62Y6s5LyVRE1Rca1XvmlyiTQ6/daSBE12ag19uBHeuSnC/tOvpK1+wL8naziwGPnhf86YI8Qcm4j6oQxzdY+FGDZRMAj5hapsmlDSwgnvAwyh/IU/sc/F2wdJ/A18kyrEp9/p6Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787304209; c=relaxed/simple;
	bh=XtXqk9X7DdhTTBFChArSfpB/C0zcv3Y5Osb0Ez3ZbdA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RGvIGveTW4cxVDLq8+WOeLjph2ru1H2VvY7w+mTw8q4qiCLmpSDE2cd2YMbuGlYh0MHjrVtlota9tb3YzRnGMqettVw2Y2e66CLYcpwqJQBOsk5W2usFsjs9PMnOUuEQvdeqoxNnTs5GNrQhpkiXetcY0ZfLciQyVS4JWFDxSdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OLmp/Q7r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OLmp/Q7r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B57C71F000E9;
	Fri, 21 Aug 2026 09:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787304199;
	bh=XtXqk9X7DdhTTBFChArSfpB/C0zcv3Y5Osb0Ez3ZbdA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OLmp/Q7reK1y+wBeVo0hZD2sO6ILFElGOItpjD0twpKu0od6H3SAnACwzoxI8O6c+
	 hlGSZBq9HO11O9V80Tc/2sDICa2JqsGSPZM4jYSqvscEytiZltoH3IrYYl3ZLs5O0I
	 4xn2H2Br78EUrV5JU8xtUBq8YFGSC6IYgh4JqQ0mfy2scj6NsYLR3gTfXNEQMXoWyI
	 /r/789J2iJJam75fZUH+WG/xDs2C36D7yNZStl793L7lM9JbpyFJsr4TsV6Mhcy2yv
	 W1WY23uDcVE28k7kikojlFgYqMcJPwua+mtrlnqQJDXgKN5AktJtvY4DLj/pLrI9ZV
	 lADyTHAtrAV5g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: trivial-devices: Add Sensirion
 STS4x series
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alessandro Zini" <alessandro.zini@siemens.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260821091924.18975-2-alessandro.zini@siemens.com>
References: <20260821091924.18975-1-alessandro.zini@siemens.com>
 <20260821091924.18975-2-alessandro.zini@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 09:23:18 +0000
Message-Id: <20260821092318.B57C71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add "sensirion,sts40" as compatible for the Sensirion STS4x/STS4xA
> series of digital temperature sensors.
>=20
> Link: https://sensirion.com/resource/datasheet/sts4x
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Alessandro Zini <alessandro.zini@siemens.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821091924.1897=
5-1-alessandro.zini@siemens.com?part=3D1

