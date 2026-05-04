Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D8C3EDACB
	for <linux-hwmon@vger.kernel.org>; Mon,  4 May 2026 19:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777922791; cv=none; b=A8qB14U3eeyUlQQr0SdMHOGBS/r/xYOTYd4R/bJBNF3+OJny1mS7j7xJIh2ICFmENohoFGW2CYFxL5EgT1bO32yKq5frEG3EX+jV4V+oGILXCKKRS3Yqq97orRDaND52sikRCrF/Xsf4R34CWuK++7TG4TaTVqGdyREgMBrLT28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777922791; c=relaxed/simple;
	bh=iwd6gl3jri1HTCh24bAevU53TF6Yg7AynbFDwFyILWU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=q/v0jSpCI8B+9pdvTr6D+uThP19WKzHFIdaAdmMmbfI48Hm2+Ri4pJJ1DC2XoLHwyWyFmgGAz1zKe3PslTIKfkSNn3Ttr5mOwViGFdl5iwHfj9VIDviHR15AoVGV1rY09C8IDccWZcqlQtnJGWHB6KPw/vN6D0VHx1A9eR3zTa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aWnrF832; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aWnrF832"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777922789; x=1809458789;
  h=date:from:to:cc:subject:message-id;
  bh=iwd6gl3jri1HTCh24bAevU53TF6Yg7AynbFDwFyILWU=;
  b=aWnrF832nBBRgsHzcXmIDxZuAQbIo+tSsnJjnqbmpkiHXQnrp/yPPscB
   jYqVXGNMe07T6kMpRroUaQW/YPg8f10LnplUZXIlNrIcNaK9SMtlP00i4
   7UrQHm8YP2XJ6bl7XjWcFHScbxeiqa3Jpq2T0DDMl1X6fI2u5gTZeGlDh
   oQrptu+RRNeONlZnl41h0gjPoEGSSshc1+ixIepoOExAdWTppVileiARi
   WdM824BP90JM/m3kP8YjOBv/0HD2Ut7Tz7IVLnNX5tihh68sxSXP8OfVa
   qEUmiVj/m12CMgTE4aVEl71ppYStyamcdIVUx6y02viGFyjDnad1u9+pY
   g==;
X-CSE-ConnectionGUID: 5wYVeR+uQk6QCcdCfPg4ZQ==
X-CSE-MsgGUID: GhTF288/SOeOvZ2XQSaObw==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="78777714"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="78777714"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 12:26:28 -0700
X-CSE-ConnectionGUID: eC7NwCSfQ7a5BZq1uT41mw==
X-CSE-MsgGUID: 1O3zeNwxRv+KTfORsOI7fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="231235126"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 04 May 2026 12:26:27 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJyvq-000000003y5-0ChL;
	Mon, 04 May 2026 19:26:19 +0000
Date: Tue, 05 May 2026 03:25:21 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:watchdog-next] BUILD SUCCESS
 a12abd4caadd4a8d194c96e8deadb2f47af5fc2b
Message-ID: <202605050311.qRC0sQs2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
branch HEAD: a12abd4caadd4a8d194c96e8deadb2f47af5fc2b  watchdog: lenovo_se10_wdt: Add support for SE10 Gen 2 platform

elapsed time: 1133m

configs tested: 55
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-15.2.0
alpha        allyesconfig    gcc-15.2.0
arc          allmodconfig    gcc-15.2.0
arc           allnoconfig    gcc-15.2.0
arc          allyesconfig    gcc-15.2.0
arm           allnoconfig    clang-23
arm          allyesconfig    gcc-15.2.0
arm64        allmodconfig    clang-19
arm64         allnoconfig    gcc-15.2.0
csky         allmodconfig    gcc-15.2.0
csky          allnoconfig    gcc-15.2.0
hexagon      allmodconfig    clang-17
hexagon       allnoconfig    clang-23
i386         allmodconfig    gcc-14
i386          allnoconfig    gcc-14
i386         allyesconfig    gcc-14
loongarch    allmodconfig    clang-19
loongarch     allnoconfig    clang-23
m68k         allmodconfig    gcc-15.2.0
m68k          allnoconfig    gcc-15.2.0
m68k         allyesconfig    gcc-15.2.0
microblaze    allnoconfig    gcc-15.2.0
microblaze   allyesconfig    gcc-15.2.0
mips         allmodconfig    gcc-15.2.0
mips          allnoconfig    gcc-15.2.0
mips         allyesconfig    gcc-15.2.0
nios2        allmodconfig    gcc-11.5.0
nios2         allnoconfig    gcc-11.5.0
openrisc     allmodconfig    gcc-15.2.0
openrisc      allnoconfig    gcc-15.2.0
parisc       allmodconfig    gcc-15.2.0
parisc        allnoconfig    gcc-15.2.0
parisc       allyesconfig    gcc-15.2.0
powerpc      allmodconfig    gcc-15.2.0
powerpc       allnoconfig    gcc-15.2.0
riscv        allmodconfig    clang-23
riscv         allnoconfig    gcc-15.2.0
riscv        allyesconfig    clang-16
s390         allmodconfig    clang-18
s390          allnoconfig    clang-23
s390         allyesconfig    gcc-15.2.0
sh           allmodconfig    gcc-15.2.0
sh            allnoconfig    gcc-15.2.0
sh           allyesconfig    gcc-15.2.0
sparc         allnoconfig    gcc-15.2.0
sparc64      allmodconfig    clang-23
um           allmodconfig    clang-19
um            allnoconfig    clang-23
um           allyesconfig    gcc-14
x86_64       allmodconfig    clang-20
x86_64        allnoconfig    clang-20
x86_64       allyesconfig    clang-20
x86_64      rhel-9.4-rust    clang-20
xtensa        allnoconfig    gcc-15.2.0
xtensa       allyesconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
