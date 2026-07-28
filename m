Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBAB3D9534;
	Tue, 28 Jul 2026 07:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785222896; cv=none; b=cPHbFAm8DMSQegBjGXw52CszaTi4jYrD/WlAP6qHSHfbU8cU4YA/wdK6xw7sVB6k60rBkdN40/Ma0FJeDOuVMRXp85MsGS/37WIuPbrqtBIu1RjvD++wCt7HTa+0HTGPRG/hM6j4XF0a8N916jeA22kec79QpAf3nEiMQ+ICnbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785222896; c=relaxed/simple;
	bh=uCU4YvqvwCbuEjT7p7O4wRTp6xVEnn521ev9QqbQYHQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RCD/TflFUBRzVAFtVd4lbb/bcqaRFLb7tiXtQj+nQfajcFVkLNJo5OAV63l5cBuLiRefgUAfXZt6Sk7o+glceN2ZLSqHHhyl9lPWfMLmSZ/MT/WwoK/xlq+cPlD0iJlBRWPDzFNXVa7TeSDs8p4Udw7Kk0xlmFjbrm9vkQRzhCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FRgqFIB9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FRgqFIB9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F413F1F000E9;
	Tue, 28 Jul 2026 07:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785222894;
	bh=uCU4YvqvwCbuEjT7p7O4wRTp6xVEnn521ev9QqbQYHQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FRgqFIB9tZezgmXydi4Zg+x7js8hRUOv0iZhljLlnGfT9N4pgV1NXyfeFEJiIGRWY
	 PEzyjCEZ/ECW/5UD4agnv8+9bKefJkbh+a08qZqyLwbJgeYRKS3wq90wJubbSrBQz0
	 j7ZJQc1t2pNc0eSLESiwzZfSeQ9A5c3OJvuP3T9yPa9aAaAtqjVPZSZh5nx0TIrWWD
	 wMcGH5esmmXjoTN7AdEfGjj6EpA9MGC3jikXQYluWcIdtQJOsxXplRtueccnSYKbdJ
	 ph8wnQvIRqyz+YdO7+wUcMecttWkBxTdZuYFCV8uWd1vsOpQHjjDozZ6QvNimEF+Oo
	 pHdogLQ8Gm6NQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 07/12] i3c: dw-i3c-master: Add SETAASA as supported
 CCC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, linux-i3c@lists.infradead.org, Frank.Li@kernel.org
In-Reply-To: <20260728065955.809445-8-akhilrajeev@nvidia.com>
References: <20260728065955.809445-1-akhilrajeev@nvidia.com>
 <20260728065955.809445-8-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 07:14:53 +0000
Message-Id: <20260728071453.F413F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add SETAASA and SETHID to the supported list of CCC commands for
> DesignWare I3C host controller.
>=20
> SETAASA is a broadcast command that assigns predefined static addresses
> to all I3C devices on the bus.
>=20
> SETHID is to stop HID bit flipping by the SPD Hub to which the SPD devices
> are connected. It is a prerequisite command to be sent before SETAASA as
> recommended by JESD300-5 and JESD403 sideband bus specifications.
>=20
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728065955.8094=
45-1-akhilrajeev@nvidia.com?part=3D7

