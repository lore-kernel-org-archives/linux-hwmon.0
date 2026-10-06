Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC1C3F1ACE
	for <linux-hwmon@vger.kernel.org>; Tue,  6 Oct 2026 14:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791297708; cv=none; b=gx+1vOw+LX/CzZmiXxQ1CmQnk7Vv7vbwZ04T8cwO/bPk1TTulbzBFwQjUB3UPmjG4V7M1CPwtejeTd9FlU/2I4wFM5ivNprIGZOYh6VGmoYn/c1EUez9fhjYM0jaOg+lkrsecGFxObDRxPVrsrLOi8FMMhCMlKQZfzpOh/OTPFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791297708; c=relaxed/simple;
	bh=gKz4b1P5+slvYjUEW2Mp3VCsHKFn5tqpqt0cm5xVN1s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AT8Rc7bikRYGBDJAUHbq09t7pm5lvENTOMG3iz/qGmaE4zJ6UwvkGcb18WJUI5qg5Y7yz+MmDfFbl0EiFzHsiANjk7TaYMbfTGhOhUiJujaFKlvp8IniaOhIvYIKpfr//R60qpzvtusnb6IkW+SUBaUqozAD0tmt2qndRiTl/b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RDFay6cf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RDFay6cf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF3341F0089B;
	Tue,  6 Oct 2026 14:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791297706;
	bh=gKz4b1P5+slvYjUEW2Mp3VCsHKFn5tqpqt0cm5xVN1s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RDFay6cfZ2BDjVrUAlGUOz7Bk8h9H/AZp00YFunoiWxKi1Uj2j6QlbXvHWlpCdv42
	 xiOl9o6WPE8TBMQWQvL/Roptn+fsZJD2WK++XiusYkTi7Z5X8w3pYv+IpqaL+JIOsw
	 BPEBjnRDHrElN4R/Qt0es4oZCsZUTw/M1VBht5Q84/pwDIs9aARRY9cThJfnkHVOWa
	 oq1+VA+L6pXta4yS60DTyy8uWU03ztdw4Gw0LJudlkxBTnRyuAhTLluy2eWP665Asl
	 iKDClEOQozTymZ/apgAUgsVY9ZM8ljc0v+IImrf//zgMZkrkCh1GZRuwdYLtZeSAEJ
	 SXCBlEl3yRT3g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] hwmon: (asus-ec-sensors) add CPU_Opt fan for ROG
 STRIX X570-E GAMING
Reply-To: sashiko-reviews@lists.linux.dev
To: "Matt Layher" <mdlayher@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261006-asus-ec-x570e-cpu-opt-v3-1-62672edc18b3@gmail.com>
References: <20261006-asus-ec-x570e-cpu-opt-v3-0-62672edc18b3@gmail.com>
 <20261006-asus-ec-x570e-cpu-opt-v3-1-62672edc18b3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Oct 2026 14:41:46 +0000
Message-Id: <20261006144146.AF3341F0089B@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Matt Layher <mdlayher@gmail.com>
>=20
> The board has a CPU_OPT fan header, which the EC reports at the same
> register (bank 0, 0xb0) as the other AMD 500 series boards. Enable it.
>=20
> Assisted-by: LLM sparse
> Signed-off-by: Matt Layher <mdlayher@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261006-asus-ec-x5=
70e-cpu-opt-v3-1-62672edc18b3@gmail.com?part=3D1

