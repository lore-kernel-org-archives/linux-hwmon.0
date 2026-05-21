Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1B016DEB1
	for <linux-hwmon@vger.kernel.org>; Thu, 21 May 2026 00:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779323140; cv=none; b=sthoIQEXI/7N4yaYKFnrxYnhHPlTEIj/PbybCXVGYWcEI+qcI2WHuqQjcZu0MoX+CrXiI/q9qFPnLJD/+jqlOvRV5EiTp9fOTkn3rSDGKva9+l0CrH79NKgxUX6P55WK1JJY6OOuPT9ZJaMW6OPt6SVUVtBncQqOiprVUDKWSfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779323140; c=relaxed/simple;
	bh=EjoJsMEFejJ8Qnrc8HXqnWIOwgD4PlynkBhDmK+5rHU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FuEeqqKmnN+HLpEmegzKjmv0Bd1VMwo5tArlD3gAF7LLkawgXyr1UOc55TuUz+OYC6j5lo84AV00B2ivEZ0VfczYDXUsl+zQSJKp/7NmvVy/jLcO/Cp9l0xFI6H4Hrqnn0vKoZeePhoFajAahRQwe0DnrrHEr6RiBOHLhkFTSEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F5Y/0x2R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F5Y/0x2R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 565F61F000E9;
	Thu, 21 May 2026 00:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779323137;
	bh=EjoJsMEFejJ8Qnrc8HXqnWIOwgD4PlynkBhDmK+5rHU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F5Y/0x2RieFx0SVqsNdBSMqOIRgyXsnZpEQD4xy/jSK5C5eNH1kb2aBOcN7KibK91
	 HHa5/+TMON+z0BalHYbdIBbW+2Lbq38P4fqDqdKmiPB6w9lnW6o5BLm90wfQOK/tLK
	 jrktOu8QQgdPeqhrvCTXa1tg0Y68miIyfVzH0ZzfO9eZulRxGt0F7EWulaq6ndvhUO
	 ISWWLpvUmNKVMwghFe12w5Gda83h0RxHPCkXCpj3Xy8oonu9Cxk0SE/triCRmPZ4zk
	 HpaSOyJt90T3Di6qRxr6HDaBs4DdiLkVyLgNbAY7aZuy9gosPZJkzrq/aKducFpLUR
	 naIZiaZwupiWg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/3] hwmon: (pmbus/adm1266) add powerup_counter
 debugfs entry
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260520-adm1266-v5-2-c72ef1fac1ea@nexthop.ai>
References: <20260520-adm1266-v5-2-c72ef1fac1ea@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 00:25:36 +0000
Message-Id: <20260521002537.565F61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The ADM1266 maintains a 16-bit non-volatile POWERUP_COUNTER register
> (0xE4, datasheet Rev. D, Table 93) that increments on every power
> cycle and cannot be reset by the host. Each blackbox record already
> embeds the counter at record time, so the standalone live value is
> primarily useful for matching a captured record back to the boot it
> came from when correlating logs.
>=20
> Expose it as a read-only debugfs file alongside sequencer_state. The
> block-read returns two payload bytes in little-endian order.
>=20
> Take pmbus_lock around the block-read so the access serialises with
> any pmbus_core sequence that sets PAGE on the device. Without it, a
> PAGE write from another thread could interleave between a PAGE set
> and a paged read elsewhere in the driver and corrupt either side's
> view of the device state machine.
>=20
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520-adm1266-v5=
-0-c72ef1fac1ea@nexthop.ai?part=3D2

