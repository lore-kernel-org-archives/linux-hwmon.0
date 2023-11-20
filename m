Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="CjQY12NB"
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.197])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8CFCCE5;
	Mon, 20 Nov 2023 00:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=ZgGtt
	8Vwx6KY+WLiRd8mNkVCUwdJFjtTfHpwI5Ps2aI=; b=CjQY12NBqUnQVagIuGS1W
	y4GFRYUuBfZaCMhUpcVkhG/8P+vVi8ykOH1WGrP3bbSnsJOdPIuRH1CDlyJV7bO1
	rJDUykT485qPLbc09PW85S+AWAY2X5fbfigwTslg5LE8ra9Wak88U2m5K3t1pvBM
	3F5lccLjmcD1mmy69/bglw=
Received: from localhost.localdomain (unknown [39.144.137.207])
	by zwqz-smtp-mta-g3-2 (Coremail) with SMTP id _____wDH52myFVtlTcE1Dg--.30221S2;
	Mon, 20 Nov 2023 16:15:47 +0800 (CST)
From: Xing Tong Wu <xingtong_wu@163.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: xingtong.wu@siemens.com,
	tobias.schaffner@siemens.com,
	gerd.haeussler.ext@siemens.com
Subject: [PATCH v2 0/2] hwmon: (nct6775) Fix pwm bugs for NCT chips
Date: Mon, 20 Nov 2023 16:15:40 +0800
Message-Id: <20231120081542.3174-1-xingtong_wu@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDH52myFVtlTcE1Dg--.30221S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVsXoUUUUU
X-Originating-IP: [39.144.137.207]
X-CM-SenderInfo: p0lqw35rqjs4rx6rljoofrz/1tbiFhUu0F44X5n24gABsI

From: Xing Tong Wu <xingtong.wu@siemens.com>

These patches address bugs in the pwm features that do not meet the
specification definition.

changes since v1:
 - Add PWM mode and mask register arrays for NCT6116
 - Delete 2nd patch for pwm_enable change
 - Delete log print and add comment for pwm failure set

Xing Tong Wu (2):
  hwmon: (nct6775) Fix incomplete register array
  hwmon: (nct6775) Fix fan speed set failure in automatic mode

 drivers/hwmon/nct6775-core.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

-- 
2.25.1

