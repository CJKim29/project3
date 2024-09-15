package com.githrd.project3.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Alias("casting")
public class CastingVo {

    int casting_idx;
    int actor_idx;
    int performance_idx;
    String casting_name;

    ActorVo actorVo;
    PerformanceVo performanceVo;
}
