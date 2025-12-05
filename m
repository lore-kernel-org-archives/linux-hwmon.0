Received: from out203-205-221-240.mail.qq.com (out203-205-221-240.mail.qq.com [203.205.221.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B115142E83;
	Fri,  5 Dec 2025 03:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764904548; cv=none; b=t+Pd/7vLkwaaJQaZDPPXyYHKGiEVLOtxm2ILc/8JWmQ5T/VPBg4GVnwpYIhr/IGn0MLm9Ywsv98w6HSZpXctFBD+ljZboiAAFwWFEPCWsgqIqaeN0qfDKQcIEYquwEDi+f6rtYI/LXw21JKxSZk13INMNdePAaGcmdwUGif2juE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764904548; c=relaxed/simple;
	bh=n5vXPZpJNyI3xLmAePufY1RLEwUgspejf2qmQbuL6Ss=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=RaX1e8zGYQPW+Ikbb3TulH4NJkwXJjBnM1HHEz015yvp5syAnSKHK4gcvEja2+dRB7VKSm6mOtYXfgdSNRhPm2Zeb4S2atk2i1Tl7QOF5oDd4Bz0drr5DEC3fG9FZn8KYvQWDoOqsiJ1GeGAIbcNz8r+mJcoH0LAP282VnB5NUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=g6FLqtzl; arc=none smtp.client-ip=203.205.221.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="g6FLqtzl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1764904536;
	bh=Xjr7u+x8bFr05PIqNd946cCjInP4SFfdDKOotTKxah0=;
	h=From:To:Cc:Subject:Date;
	b=g6FLqtzlpsGfMdwvlXU21NF7i+r0wW0QBsrWa6pC98vOCU1zRDcSopohoOe8zDJ3G
	 5oBhzUw6UT4kXCVVlkzLlwI3wbtA9LegLq2BCKzVirfuY6URtMTdwiZR4sMz+wtfR7
	 lkWz5Q2VNpRyKb3gxveyd7KIpWCUnHhlcYwmmwnQ=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrszc41-0.qq.com (NewEsmtp) with SMTP
	id 3E308C19; Fri, 05 Dec 2025 11:15:35 +0800
X-QQ-mid: xmsmtpt1764904535tw0i2sck4
Message-ID: <tencent_5CDC08544C901D5ECA270573D5AEE3117108@qq.com>
X-QQ-XMAILINFO: M2SvzgchpLqfYlIeNoHnEQT4BRH5c53FIb66SojsR7jrjT6n3U2DukvL1kHWEM
	 BI4JNL1m03sAZpJl5JjoXonBRC1JvvPGcDeF25DRzMaXK79RzMw2XaGflhrFIYrwDQu5XJS3CC+o
	 Unmo/Q2mpYbIS1y7pdnJvyfok7vsO/8Mnmi0MGZexn5y79kAKJvNETub8sNYDqTnJ12/Yc+qita2
	 sBboBLOD89OA9dka1eM0XcnMu82lasMfbAwWiZKKnxPXQ8zBFJ0nkQniEnK1uWgr90y6ai4r4tmP
	 +2e3wV9+N1wKUN1wVk8jHuOGqzukeu5a6qNojuYsryRLH78InK/0gkqiJu2ELEcd/DIcgRn/PZuM
	 p43vJJtP9JKIqrd8Y4P1bW020ohCbh001rt7g0nFBSmLb0pghTO5GuVXF3WTi1z/sSpfWWwr189h
	 lqglK/DuOt+zmqzg+TQYDWDk6N/Qp/fY9SRWljR5XGp5fKp8HXzlQDbi+ncfOoo+8UQHTYDWZiWi
	 9gBJ/ZKVN7pYnT641BzzytVdTc+cOHER41YDbeYtT50V+mHaQ88ERciBVbCnEgmw67QzEe8KnuRE
	 xFlg5hLEVhGJhHw9BMKAhHHv29Y3rrlYxrQHZPyysXTCmsSA7hEeam6Wa3RWMF+fl999im9H50hx
	 /+J+fZrdfoyPgOgVmSS7pKlX9b9cLkOlXeArfvjY/dc/wO4ekWzO04l5Iz8GjdABi6gVO/4dYMbC
	 0a5S9ZQbj96P9W0ldw2cSTy+QS/zIOPQW2kxw41w1Kb3AMRqxI2t8mA2wt7tMiNdy4U4hj3Y3EPM
	 y9HOGnDnTcQ6zZ14yu82T8CYC3f6DrTc0TIv9ERzTpYqWUOBKJytQJmKej7jT8PuNBq35jnfC8Na
	 V9eRvFKOi0jaK6NPJl/5jhJywEkpLexwELrw+dLqLQwxC2Ga9bF0wcAuxlfnmUcutQStrEqlzTeO
	 ggxM4wEzqdDSS6bhhqwoczP2dDMj4ZnQI99J8TAGD0anFY5zXcEx8NseT9j+qp
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
From: xiaopeitux@foxmail.com
To: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	florin.leotescu@nxp.com
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH] hwmon: (emc2305): fix device node refcount leak in error path
Date: Fri,  5 Dec 2025 11:15:13 +0800
X-OQ-MSGID: <2e06f8769ad0721ac5f47f87ac0fa541912c3b53.1764904402.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pei Xiao <xiaopei01@kylinos.cn>

The for_each_child_of_node() macro automatically manages device node
reference counts during normal iteration. However, when breaking out
of the loop early with return, the current iteration's node is not
automatically released, leading to a reference count leak.

Fix this by adding of_node_put(child) before returning from the loop
when emc2305_set_single_tz() fails.

This issue could lead to memory leaks over multiple probe cycles.

Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 drivers/hwmon/emc2305.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/emc2305.c b/drivers/hwmon/emc2305.c
index 60809289f816..84cb9b72cb6c 100644
--- a/drivers/hwmon/emc2305.c
+++ b/drivers/hwmon/emc2305.c
@@ -685,8 +685,10 @@ static int emc2305_probe(struct i2c_client *client)
 			i = 0;
 			for_each_child_of_node(dev->of_node, child) {
 				ret = emc2305_set_single_tz(dev, child, i);
-				if (ret != 0)
+				if (ret != 0) {
+					of_node_put(child);
 					return ret;
+				}
 				i++;
 			}
 		} else {
-- 
2.25.1

