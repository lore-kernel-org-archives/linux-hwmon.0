Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BCC3A7837
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Apr 2026 10:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775818758; cv=none; b=dq1UMIaPQazXwz5ouH6ht/5tKs87OvjsR+PxNGsLfN9IAk+jiiqFPtAUZeupXmZ86jNkwQm7akGZBj9pnPySWHxo1voz3cbkV8FtP2nHkC6WrW95PZVppTKUvqrG6iiwb5PmAIT3cYmJWWKCA6AQxfatNzydw0FRxgWkHdwRWiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775818758; c=relaxed/simple;
	bh=+5BeJza8tFJggQKZRXrTb/CvIX3BJmiN7ADIC6ArjTQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZZEqofhyqGwxOHGekGKoiaD7k776mUyYlLg8a9Jzf+pI2duHbt3RcbLs3SsrD3x8DKuyng9qcd6z8qii8zLaAz0t888SILf5OCPrvWwKvCNeb2AA400hTyiZzFpA35g9OpCGU5xFDo21eACUHKBcoF5Rz4GBDb6H7QDY9Klpz5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HHxAwEBV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HHxAwEBV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A229EC2BCB9
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Apr 2026 10:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775818758;
	bh=+5BeJza8tFJggQKZRXrTb/CvIX3BJmiN7ADIC6ArjTQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HHxAwEBVmcrttpwI/SR6I64Sbiaj11QhNyvBcmN6j4aeDaI+qv11vxvItfvG51B77
	 +ypb/SkBko6g0Hq63q962rkii46SiWh2YeSM/kaFdy9k52q82y+A4kd38ASt+1sFTQ
	 jo12amLfxjXWzFa3KNlWveSffbuE04owIcoHkcr5smhZxul73IPqOPIfMVGR9AsD6y
	 YfEoj7gP1V3hZna1ehRcaIipqnrNjzJDtb5c+DA9gc48TfxDjoQ3mcJii4jeXyCE1e
	 83g7vgpPuMXfvhFMfQkdJxGYfE0o5gj6tF/IpwWHWzZVeUH8DRJuiCopO/iJMJCr8g
	 iPBdUQKBa9w0A==
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7d7ebe11bffso1741628a34.0
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Apr 2026 03:59:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUGbGQeSy6NC0npQem/n9sDqZACKZkNFzgwd/VavMfl68sIbUWJcnjjcnTfjP85xN6W1WLPkNAW7tY7Gg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhXVEBO4gSxFes1aEoNqQZ6jiaRtNJ6dBlPeU9To8LnInxkpsR
	qgihZjvGJDNQdRRXtl57ySOgb5woHwvwTxkaXngQ3nDNY+uaX/eI/t6qnrnHCc06c4x/q40Gns4
	w1JZgLi4M51wbIvZv2BYz0hvlRP6GBX8=
X-Received: by 2002:a05:6820:98b:b0:681:aa84:a8ff with SMTP id
 006d021491bc7-68be5c5f183mr1355226eaf.12.1775818757753; Fri, 10 Apr 2026
 03:59:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <adhalQxfbMsL3V0T@lizhi-Precision-Tower-5810> <20260410044515.23667-1-akhilrajeev@nvidia.com>
In-Reply-To: <20260410044515.23667-1-akhilrajeev@nvidia.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 10 Apr 2026 12:59:06 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0jW9=VtjyjeoEDTm9hrGKP_BYUeuKCxcKoV-VsvM5otiA@mail.gmail.com>
X-Gm-Features: AQROBzD6jULSRxFPRJ1yn6HfdmojDgv925IrU6md6SEHp_9VWUijmSzMQiuaa9c
Message-ID: <CAJZ5v0jW9=VtjyjeoEDTm9hrGKP_BYUeuKCxcKoV-VsvM5otiA@mail.gmail.com>
Subject: Re: [PATCH v2 02/13] ACPICA: Read LVR from the I2C resource descriptor
To: Akhil R <akhilrajeev@nvidia.com>
Cc: frank.li@nxp.com, acpica-devel@lists.linux.dev, 
	alexandre.belloni@bootlin.com, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, ebiggers@kernel.org, krzk+dt@kernel.org, 
	lenb@kernel.org, linux-acpi@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux@roeck-us.net, miquel.raynal@bootlin.com, p.zabel@pengutronix.de, 
	rafael@kernel.org, robh@kernel.org, sakari.ailus@linux.intel.com, 
	wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2026 at 6:45=E2=80=AFAM Akhil R <akhilrajeev@nvidia.com> wr=
ote:
>
> On Thu, 9 Apr 2026 22:04:05 -0400, Frank Li wrote:
> > On Thu, Apr 09, 2026 at 04:27:32PM +0530, Akhil R wrote:
> >> ACPI 6.3 specifies byte 8 of I2C Serial Bus Connection descriptor to b=
e
> >> used for Legacy Virtual Register (LVR) data as specified in the MIPI
> >> I3C Specification for an I2C device connected to an I3C Host Controlle=
r.
> >> LVR will be read by I3C host controller drivers and it provides detail=
s
> >> about the specific speed and 50ns spike filter capabilities of I2C
> >> devices.
> >>
> >> Update the rsconvert_info to include this field. For I2C devices on an
> >> I2C bus, this field is Reserved and unused.
> >>
> >> This commit is the result of squashing the following:
> >> ACPICA commit 70082dc8fc847673ac7f4bbb1541776730f0b63e
> >> ACPICA commit e62e74baf7e08cf059ec82049aeccd565b24d661
> >> ACPICA commit c404118235108012cad396c834b5aabe2dd1b51a
> >> ACPICA commit 7650d4a889ea7907060bfce89f4f780ce83e7b28
> >> ACPICA commit 014fa9f2dbcc6b1bd42a4a4a6f6705d9cf7d460b
> >
> > These commit number is not existed at linus official tree. Please remov=
e it.
>
> These are commits from ACPI-CA github. The files in the acpica folder is
> a mirror of that repo. I suppose the commits in this folder are expected
> to be structured like this. The process is also described here -
> https://docs.kernel.org/driver-api/acpi/linuxized-acpica.html

While the above is correct overall, it would also be sufficient to use
Link: tags pointing to those commits.
