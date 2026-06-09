Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC9836215E
	for <linux-hwmon@vger.kernel.org>; Tue,  9 Jun 2026 16:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781024119; cv=none; b=nenGcrQtCONzs31GQCDWH8kLwQJlzwViJ+i1kqWq6bc+dXI7FxY77Z6da7WJVE8xHHEc6xO6nGnGekwpQCDdKowV3Qxsyul1QrS7j3llxAjamnFDE5ziM3Gv075ucWuh//xLFlmjkeCuxQFDJJBkrhmwt4xNubAtiGfD9LL/pYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781024119; c=relaxed/simple;
	bh=YKfMXiefrCFYzdeCzUPU4jiRcnHzP7UAE8wMn+iYs88=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XqrTT+kg1YIvj5NyQRz2+KMhGaXB0ePeBHbsHTDl0v3Iw0aVwH3amF7NMEXXS2HWpcJSE9KUi55fr5ZQmMVsUMQaoG+BQcGNr7k9xQjFOxh/N+kMPJKD+/G6qDHbwc1FxF1qlTiNF4K9iWXanmuk5OjSJyTw7ROkQblzFCOV7Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nxDG6l2Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nxDG6l2Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54F6A1F00893;
	Tue,  9 Jun 2026 16:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781024118;
	bh=YKfMXiefrCFYzdeCzUPU4jiRcnHzP7UAE8wMn+iYs88=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nxDG6l2ZRSOxkFqjfcImOJ/s816S85HFxuDkz+G7o5CQDNRIpBV1zc5FY7CrbNYO+
	 4JleH9bieac70RTc0Pg4sGCxAqiFuk/MpVAGzp+yjhFNJtk4SPfh4mdlPiKa+Yi9ig
	 gbKt2xuYglYfAu7LhTIqDRWkCn5pZnOyTzM26KDIJqjEh5Z92bEx/tdo6qZ4cE1ryF
	 jULBPtoFQSZKsf8jvfJUA3ByCOzdXvTwFkWkDi+ckVwP5JwFa6UodRsfIhPKj2M0QB
	 G709DPXvnyqQrKfoE3/OEHbKux10zKfQasdXlrF7VNMq4bLc2dqWOWvYj9FpbalDl9
	 OU+1reyBI0MPQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 RESEND 1/2] scsi: mpt3sas: add IO Unit Page 7 config
 accessor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis Sautier" <sautier.louis@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260609164423.2829699-2-sautier.louis@gmail.com>
References: <20260609164423.2829699-2-sautier.louis@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 16:55:17 +0000
Message-Id: <20260609165518.54F6A1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add mpt3sas_config_get_iounit_pg7(), mirroring the existing iounit
> page accessors. Used by the hwmon driver added in the following patch
> to read the IOC and board temperatures.
>=20
> Assisted-by: Claude:claude-opus-4-7
> Signed-off-by: Louis Sautier <sautier.louis@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609164423.2829=
699-1-sautier.louis@gmail.com?part=3D1

