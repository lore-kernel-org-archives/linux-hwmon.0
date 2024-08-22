Received: from sdfgruop.com (sdfgruop.com [185.239.236.61])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27DBA15ACA
	for <linux-hwmon@vger.kernel.org>; Thu, 22 Aug 2024 02:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.239.236.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724294815; cv=none; b=FBx66Kx9/DVY/B4ilZ4JQ6Y3apmPT0v5YpZQUxPM76Rb89QO2wBgUJUqWXNuNbOOzROnY8NBZqqzuJjUdZ6ves0DhYrFBVCs3k5hQivkJsWVUZDYZC7h6rOYB39sN7SRTIQB3vuL6hmRyyb/HN/HUUGUY/c4bLaBjZYNGzv7BtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724294815; c=relaxed/simple;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=GXRiFsLMyjZQE/SX+6t8oUJz9CWElEzyRg10iy2JPl/XnGA9gyaFvEciBNVDXsJI1CUP2wzcyN/NenRohHpdAO+0WB+8cCFc4m7uj7pB3EMGMmY3IIgbWDL3/7FRPsH+myD11J6CKvrsg3oasvASGmN9gfJ/pPrXzA1e5T4/DEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdfgruop.com; spf=none smtp.mailfrom=sdfgruop.com; dkim=pass (1024-bit key) header.d=sdfgruop.com header.i=@sdfgruop.com header.b=hRDvER4T; arc=none smtp.client-ip=185.239.236.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdfgruop.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=sdfgruop.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sdfgruop.com header.i=@sdfgruop.com header.b="hRDvER4T"
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed;
	d=sdfgruop.com; s=default; h=From:To:Subject:MIME-Version; bh=2j
	mj7l5rSw0yVb/vlWAYkK/YBwk=; b=hRDvER4T2jaCD+9P6ywnuDx+CcEPTlDntz
	g4QcMsvdr9b3KrWcAY/aJRSE3il+bw6dGXNhvGzqz+r5Iw6SvE7pS5lglMnoVoyd
	ljrdCxK7+Qcmc9iICq+iCu1KbzlRtlyzkM0ZEYbdYJf315dkSieUQg7qW9N7Hsi3
	BN8FUlCSk=
From: Mail Server <mseyani@sdfgruop.com>
To: linux-hwmon@vger.kernel.org
Subject: Email Security upgrading process 
Date: 22 Aug 2024 04:46:53 +0200
Message-ID: <20240822044653.F0412A591F85C665@sdfgruop.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

