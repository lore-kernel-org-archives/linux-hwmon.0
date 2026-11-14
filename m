Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794678475;
	b=KlukCqPngM25jwaExYp+F7tPJCdHVFnwRY7qhQgWFjaV81ROkskqvB1GHqtzZpZHCqBb
	 EK2R0d53NGKoRF/fZQSwba2XC6UUXhNH7rUOz4gwLSagHLvCfiC8MjIrDoiT+gKWFvPes
	 3Jm8KriQ3LKgheX1/wB/QJZnRLGKHJPuX5n+l+duZm3h6pDWnsgBadKeXfHiq9L+lU/Xa
	 tkTM2r5vWWHc3DPXx5WrwQyeGWGodfpTNagpNdVbUc94ovt7QYoxBWz9oxvNeu22EkvTh
	 PVNgjfOtJtCGArvj6qpoXGmHHQFNdfl+xlQHTLbSmDqpXhG+tHnRUc43DA7Z8GzPmuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794678475;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=zYKNhBQbOk9E2IK7LXtK8ZytUH8RVT57guPL8Og/YBA=;
	b=enF0696OFZHrHAxtExjoaEno5m4DByqnf/Hk7Y2GoHKx0Ue0TjH5jtFHvk3VeGrUZrLM
	 H3ZDnLBNK44Sp3XpFOlfo7PnuC4egawHmtt/qiq88kk1vgCp+Ma56EfSU0G4dyKKBPC5/
	 QvFt4TGiLVE/suR3rh0w+ou6Ar60dLJhQ7UKmQ5xayIPJKbTeZtfk0MrZeW8+Pchy9lDb
	 aigfDFDtlHaZ+FWNxeVFHCqSb62Vjr2NqZiVbvUXlVG2g6MgCAVAgVn9pUCR8yKjUgb/q
	 LKj7nAaY7CJ+Jq6LGResGp1jpgZpxRP+EWX0ZUPQful2Pg+eafIS688jFxe+cr6fmYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dTL5b3Zp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC5B606A327
	for <linux-hwmon@vger.kernel.org>; Sat, 14 Nov 2026 17:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dTL5b3Zp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66EC11F000C4;
	Sat, 14 Nov 2026 17:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794678474;
	bh=zYKNhBQbOk9E2IK7LXtK8ZytUH8RVT57guPL8Og/YBA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dTL5b3ZpfWvmCsnq3ujF3gx6d3fyskCgyjSMGPwJsIwECb/zEDR9UJOoBNWYdhiXO
	 x2TH0kUIHYEg+LC+O9WPEprPjH77hcSdOfPs8jEskweA9y1sp5f3j9FWcfpamo/PgO
	 gdKLnxXlw4hpKsWoM6gDmi8arMaZamO7lAuYZ4H2Wolu1iLS+a+i8moLuBY8BHNqoA
	 rW+FSFZZLaAgwhTH/268axP9MYRRRfljrefYvNfawaYuV3lJOnK1y/2Q7us/9mDjGJ
	 s1NI+969CN5sfzvOgub1zn+XS3Q4RONgO3i7XO5Ytq6P8dXOlLX1KDo0Ueln9GqelG
	 CdscWIiFyCgyA==
Message-ID: <sashiko-outbox-214856@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/7] alpha: marvel: refresh environmental readings
 through the console
Reply-To: sashiko-reviews@lists.linux.dev
To: "Matt Turner" <mattst88@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261114-marvel-env-v1-3-890328e4b7e5@gmail.com>
References: <20261114-marvel-env-v1-0-890328e4b7e5@gmail.com>
 <20261114-marvel-env-v1-3-890328e4b7e5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 17:47:53 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The SRM console keeps the readings of the temperature, fan, voltage and
> power supply sensors in the power and environment (P&E) nodes of the
> config tree (GCT), and refreshes those of one node when asked through
> config tree callback 0x28, function 0x1f. Add the callback and
> marvel_cfgtree_partial_update() for a sensor driver to use, retrying,
> as Tru64 UNIX does, while the console reports busy.
>=20
> On an ES47 the callback takes 13 to 300 ms per node with interrupts
> disabled. The console callbacks are not reentrant: a refresh on one CPU
> while another printed to the SRM console killed the second CPU, and the
> service processor reset the partition. So export the srmcons callback
> lock and hold it around the call.
>=20
> Tru64 UNIX makes this and its other runtime config tree callbacks only on
> the master CPU, and the Marvel PAL TOY calls are already known to work
> only on the boot CPU, so make the call there as well.
>=20
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114-marvel-env=
-v1-0-890328e4b7e5@gmail.com?part=3D3

