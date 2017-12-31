var roleBuilder = {

    /** @param {Creep} creep **/
    run: function(creep) {

	    if(creep.memory.working && creep.carry.energy == 0) {
            creep.memory.working = false;
            creep.say('🔄 harvest');
	    }
	    if(!creep.memory.working && creep.carry.energy == creep.carryCapacity) {
	        creep.memory.working = true;
	        delete creep.memory.source
	        creep.say('🚧 build');
	    }

        

    if(creep.memory.working && creep.memory.target!=null) {
            if(creep.build(creep.memory.target) == ERR_NOT_IN_RANGE) {
                creep.moveTo(creep.memory.target,  {visualizePathStyle: {stroke: '#ffffff'}})
            }
	}

	    else if(creep.memory.storageout!=null){
            if (creep.withdraw(creep.memory.storageout, RESOURCE_ENERGY) == ERR_NOT_IN_RANGE){
                creep.moveTo(creep.memory.storageout, {visualizePathStyle: {stroke: '#ffaa00'}});
            }
        }
        else if (creep.memory.containerout!=null){
            if (creep.withdraw(creep.memory.containerout, RESOURCE_ENERGY) == ERR_NOT_IN_RANGE){
                creep.moveTo(creep.memory.containerout, {visualizePathStyle: {stroke: '#ffaa00'}});
            }
            
	    }
	    else {
	       
            if(creep.harvest(creep.memory.source) == ERR_NOT_IN_RANGE) {
                creep.moveTo(creep.memory.source, {visualizePathStyle: {stroke: '#ffaa00'}});

            }
	    }

	}
};

module.exports = roleBuilder;
