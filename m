Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A38029B0
	for <linux-hwmon@vger.kernel.org>; Tue, 26 Mar 2024 05:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711430699; cv=none; b=YBc1K4V7dzyIH0kvXNEu0pYvj71LpDENuZD802eu+76mByyNreq93CoIN4LnZehMoMtFHEgbq8kea0zhdRLg4Qe/qMtz88BTFvP5V42wDmpjLyCu2z9DKA4J6pj7zStVSOrEiBTfpV2DtR6U84YS1wjFNrQoLIZbZCGORjCeKes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711430699; c=relaxed/simple;
	bh=AViYF1NCklLx212SBPJehrJECwfibuiBxPqLJtDplBY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LfBM5CaMyhzBYxAIw5HvI9n1BpAU4U+xnWp4GoK7aXRR18kZ3q6XQE3zmx0wOb7V821QglgMVBD9krIqjs1eo7BLVm0tUsx+IZl3GgC/MgKh47DOTC2iHAD04AUDu+HeNqiFoWbAWwjQnAAGFXpenDJqwXnJDR8tIIVv74bhQc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=do/7SMyJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="do/7SMyJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711430697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AViYF1NCklLx212SBPJehrJECwfibuiBxPqLJtDplBY=;
	b=do/7SMyJHPeeMHCloDDviX24Q0NwUSREXb6ps6e83YAUgjl9BxBhqj3BvfNw/KkmQ3AiHg
	61Y0SkahTkvO0UjyNY0L9+3DOJ9gYggVdstYhDinJo1weLi02r+r1L1DwmRROwdNeJnkf/
	i/Xra8aJiMsMRtSSvGn72w1D/8iisUY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-178-f5WDhvtaOnOqWVZRIbxgqw-1; Tue, 26 Mar 2024 01:24:53 -0400
X-MC-Unique: f5WDhvtaOnOqWVZRIbxgqw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 30199185A784;
	Tue, 26 Mar 2024 05:24:53 +0000 (UTC)
Received: from fedora.flets-east.jp (unknown [10.64.240.7])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D74CC3C20;
	Tue, 26 Mar 2024 05:24:51 +0000 (UTC)
From: Seiji Nishikawa <snishika@redhat.com>
To: pali@kernel.org
Cc: jdelvare@suse.com,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	snishika@redhat.com
Subject: 'Re: [PATCH v2] hwmon: (dell-smm) Add Dell Precision 7540 to fan control whitelist'
Date: Tue, 26 Mar 2024 14:24:50 +0900
Message-Id: <20240326052450.70217-1-snishika@redhat.com>
In-Reply-To: <3ce4861a-84e7-4b57-9f20-f710e7933852@roeck-us.net>
References: <3ce4861a-84e7-4b57-9f20-f710e7933852@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1

On Tue, Mar 26, 2024 at 1:08 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Mon, Mar 25, 2024 at 01:59:13PM +0900, Seiji Nishikawa wrote:
> > Add Precision 7540 to the fan control whitelist, in addition to 7510.
> >
> > Signed-off-by: Seiji Nishikawa <snishika@redhat.com>
>
> Applied. Note though that sending a new version of a patch as reply to
> an older one may easily result in it getting lost, so I'd recommend not
> to do that.

Thank you. Noted. I won't do that again.

